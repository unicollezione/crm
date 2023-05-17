# frozen_string_literal: true

# Trello::Board.find("5a9c5426")
#
#=> #<Trello::Board:0x00007fdf888a16b8
# @__attributes=
#  {"id"=>"5354b9475cd",
#   "starred"=>nil,
#   "pinned"=>false,
#   "url"=>"https://trello.com/b/asdf/new-project",
#   "short_url"=>"https://trello.com/b/asdfasdf",
#   "prefs"=>
#    {"permissionLevel"=>"private",
#     "hideVotes"=>false,
#     "voting"=>"members",
#     "comments"=>"members",
#     "invitations"=>"members",
#     "selfJoin"=>false,
#     "cardCovers"=>true,
#     "isTemplate"=>false,
#     "cardAging"=>"regular",
#     "calendarFeedEnabled"=>false,
#     "hiddenPluginBoardButtons"=>[],
#     "background"=>"blue",
#     "backgroundColor"=>"#0079BF",
#     "backgroundImage"=>nil,
#     "backgroundImageScaled"=>nil,
#     "backgroundTile"=>false,
#     "backgroundBrightness"=>"dark",
#     "backgroundBottomColor"=>"#0079BF",
#     "backgroundTopColor"=>"#0079BF",
#     "canBePublic"=>true,
#     "canBeEnterprise"=>true,
#     "canBeOrg"=>true,
#     "canBePrivate"=>true,
#     "canInvite"=>true},
#   "last_activity_date"=>nil,
#   "description_data"=>nil,
#   "enterprise_id"=>nil,
#   "name"=>"New Project",
#   "description"=>"",
#   "organization_id"=>"60c9511858ed4887fdb58310",
#   "visibility_level"=>"private",
#   "voting_permission_level"=>"members",
#   "comment_permission_level"=>"members",
#   "invitation_permission_level"=>"members",
#   "enable_self_join"=>false,
#   "enable_card_covers"=>true,
#   "background_color"=>"blue",
#   "background_image"=>nil,
#   "card_aging_type"=>"regular",
#   "use_default_labels"=>nil,
#   "use_default_lists"=>nil,
#   "source_board_id"=>nil,
#   "keep_cards_from_source"=>nil,
#   "power_ups"=>nil,
#   "closed"=>false,
#   "subscribed"=>nil},
# @client=
#  #<Trello::Client:0x00007fdf83a3ba78
#   @auth_policy=
#    #<Trello::Authorization::BasicAuthPolicy:0x00007fdf87fea218 @developer_public_key="", @member_token="">,
#   @configuration=
#    #<Trello::Configuration:0x00007fdf83a3ba28
#     @developer_public_key="",
#     @member_token="",
#     @oauth_token="",
#     @oauth_token_secret=nil>>>

Trestle.resource(:orders) do # rubocop:disable Metrics/BlockLength
  menu do
    group :orders do
      item :orders, icon: 'fa fa-shopping-cart', priority: :first
    end
  end

  search do |query|
    if query
      Order
        .joins(:customer).where('customers.nickname ILIKE ?', "%#{query}%")
        .or(Order.joins(:customer).where('orders.idx = ?', query.to_i))
        .order(created_at: :desc)
    else
      Order
        .all
        .includes(:fabric, :measures, :product)
        .order(created_at: :desc)
    end
  end

  active_storage_fields do
    [:illustration]
  end

  collection do
    Order.order(created_at: :desc).with_attached_illustration
  end

  scopes do
    scope :all, default: true
    scope :warning, -> { Order.where(ready_at: 7.days.ago..7.days.from_now) }
    scope :unpaid, -> { Order.unpaid }

    Workroom.all.map do |workroom|
      scope workroom.name.to_sym, -> { Order.where(workroom_id: workroom.id) }
    end

    Order.pluck(:aasm_state).map do |state|
      scope state&.to_sym, -> { Order.where(aasm_state: state) }
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :idx
    column :клиент, ->(order) { order.customer.nickname }
    column :trello_url, ->(order) { link_to 'trello', order.trello_url }
    column :дата_продажи, ->(order) { order.purchased_at&.to_formatted_s(:short) }
    column :продукт, ->(order) { order.product.name }
    column :ткань, ->(order) { order.fabric.title }
    column :наличие, ->(order) { order.aasm_state }
    column :производство, ->(order) { order.workroom.name }
    column :коммент, ->(order) { order.comment }
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |order| # rubocop:disable Metrics/BlockLength
    tab :order do # rubocop:disable Metrics/BlockLength
      row do
        col(sm: 3) { text_field :idx }
        col(sm: 3) { text_field :prepayment, label: 'предоплата' }
        col(sm: 3) { text_field :payment, label: 'оплата' }
        col(sm: 2) { check_box :payed, label: 'оплачено' }
      end

      row do
        col(sm: 6) do
          select :customer_id, Customer.all, { label: 'покупатель' }
        end

        col(sm: 6) do
          select :product_id, Product.all, { label: 'продукт' }
        end
      end

      row do
        col(sm: 6) do
          text_area :notes, label: 'мерки'
        end
        col(sm: 6) do
          select :fabric_id, Fabric.all, { label: 'Ткань' }
          select :workroom_id, Workroom.all, { label: 'производство' }
        end
      end

      row do
        col do
          text_field :comment
        end
      end

      row do
        col(sm: 6) do
          table order.order_measures, admin: :order_measures do
            column :measure
            column :value
          end
          concat admin_link_to 'add measure',
                               admin: :order_measures,
                               action: :new,
                               params: { order_id: order.id },
                               class: 'btn btn-success'
        end

        col(sm: 6) do
          unless order.new_record?
            table(order.product.product_measurements, admin: :product_measurements) do
              column :measure
              column :range
            end
          end
        end
      end

      row do
        col(sm: 6) do
          render 'fabric', order: order # rubocop:disable Style/HashSyntax
        end

        col(sm: 6) do
          select :aasm_state, ['---', 'купить', 'в_офисе', 'на_производстве'], { label: 'наличие' }
        end
      end

      active_storage_field :illustration

      row do
        col(sm: 3) { date_field :purchased_at, label: 'продали изделие' }
        col(sm: 3) { date_field :ready_at, label: 'готовность к' }
      end

      render 'image', order: order # rubocop:disable Style/HashSyntax

      row do
        col(sm: 4) { datetime_field :updated_at }
        col(sm: 4) { datetime_field :created_at }
        col(sm: 4) { datetime_field :prepared_at }
      end

      row do
        col(sm: 4) { text_field :trello_card_id }
      end
    end

    tab :tracking do
      if order.trello_card_id.present?
        row do
          require 'uri'
          url = URI::HTTP.build(host: ENV.fetch('HOST'), path: ['/tracking', order.trello_card_id].join('/'))
          link_to(url.to_s, url.to_s, target: '_blank')
        end
      end

      if order.order_events.size.positive?
        label "events (#{order.order_events.count})"

        row do
          order.order_events.each do |event|
            col(sm: 3) { event.event_source }
            col(sm: 3) { event.body['creator'] }
            col(sm: 3) { event.body['list_after'] }
            col(sm: 3) { event.created_at }
          end
        end
      end
    end

    tab :trello do
      col(sm: 6) do
        select :trello_card_id,
               lists_for(order),
               selected: order.trello_card&.list&.name,
               label: 'list'
      end
      col(sm: 2) do
        link_to 'trello', order.trello_url, target: '_blank', class: 'external-link'
      end
    end

    tab :cards do
      col(sm: 6) do
        order.idx &&
          link_to('trello',
                  Rails.application.routes.url_helpers.card_path(order.idx),
                  target: '_blank',
                  class: 'btn btn-primary m-2')
      end
      col(sm: 6) do
        order.idx &&
          link_to('card',
                  Rails.application.routes.url_helpers.image_card_path(order.idx),
                  target: '_blank',
                  class: 'btn btn-primary m-2')
      end
    end
  end
end

def lists_for(order)
  order.trello_card &&
    order.trello_card.board.lists.map { |list| [list.name, list.id] }
rescue Trello::Error
  []
end
