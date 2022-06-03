# frozen_string_literal: true

# Trello::Board.find("5354b9475cdad1642a9c5426")
#
#=> #<Trello::Board:0x00007fdf888a16b8
# @__attributes=
#  {"id"=>"5354b9475cdad1642a9c5426",
#   "starred"=>nil,
#   "pinned"=>false,
#   "url"=>"https://trello.com/b/PV2OtZdD/new-project",
#   "short_url"=>"https://trello.com/b/PV2OtZdD",
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
#   "organization_id"=>"60c9511858ed4887fdb5827b",
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
#    #<Trello::Authorization::BasicAuthPolicy:0x00007fdf87fea218 @developer_public_key="f84381c572fa423f5cfc5b0a053d12d8", @member_token="01cb54a86bad592d68df1e023dbf6923938be607c8e72a9e6f5ae8b3a09e49b8">,
#   @configuration=
#    #<Trello::Configuration:0x00007fdf83a3ba28
#     @developer_public_key="f84381c572fa423f5cfc5b0a053d12d8",
#     @member_token="01cb54a86bad592d68df1e023dbf6923938be607c8e72a9e6f5ae8b3a09e49b8",
#     @oauth_token="1b2574b0cf0782c7c596c637197fa628149aee9b4b2009029f32043d650325f9",
#     @oauth_token_secret=nil>>>

Trestle.resource(:orders) do
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
      scope state.to_sym, -> { Order.where(aasm_state: state) }
    end
  end
  # Customize the table columns shown on the index view.
  #
  table do
    column :idx
    column :клиент, ->(order) { order.customer.nickname }
    column :дата_продажи, ->(order) { order.purchased_at }
    column :продукт, ->(order) { order.product.name }
    column :ткань, ->(order) { order.fabric.title }
    column :наличие, ->(order) { order.aasm_state }
    column :коммент, ->(order) { order.comment }
    column :производство, ->(order) { order.workroom.name }
    column :created_at, align: :center
    column :trello_url, link: true
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |order| # rubocop:disable Metrics/BlockLength
    tab :order do
      row do
        col(xs: 3) { text_field :idx }
        col(xs: 3) { date_field :purchased_at, label: 'дата' }
        col(xs: 3) { date_field :ready_at, label: 'сдача' }
        col(xs: 2) do
          static_field :trello do
            link_to 'trello', order.trello_url, target: '_blank', class: 'external-link'
          end
        end
      end

      row do
        col(xs: 3) { text_field :prepayment, label: 'предоплата' }
        col(xs: 3) { text_field :payment, label: 'оплата' }
        col(xs: 3) { check_box :payed, label: 'оплачено' }
      end

      row do
        col(xs: 6) { select :customer_id, Customer.all, { label: 'покупатель' } }
        col(xs: 6) { select :product_id, Product.all, { label: 'продукт' } }
      end

      row do
        text_area :notes, label: 'мерки'
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

      # fields_for :order_measures, order.order_measures do |measure|
      # render 'order_measure', order_measure: measure if measure.present?
      # text_field 'value'
      # actions
      # end if order.order_measures.present?

      # row do
      #   col(sm: 6) do
      #     select :measures, Measure.all, { label: :measures }
      #     order.order_measures.each do |_measure|
      #       text_field :id
      #     end
      #   end
      # end

      row do
        col(xs: 6) { render 'fabric', order: order }
        col(xs: 6) { select :fabric_id, Fabric.all, { label: 'Ткань' } }
      end

      row do
        col(xs: 6) { select :aasm_state, ['---', 'купить', 'в_офисе', 'на_производстве'], { label: 'наличие' } }
        col(xs: 6) { select :workroom_id, Workroom.all, { label: 'производство' } }
      end

      active_storage_field :illustration
      text_field :comment
      text_field :trello_url

      render 'image', order: order
      row do
        col { datetime_field :updated_at }
        col { datetime_field :created_at }
        col { datetime_field :prepared_at }
      end
    end

    tab :trello do
      col(xs: 6) do
        select :trello_card_id,
               lists_for(order),
               selected: order.trello_card&.list,
               label: 'list'
      end
    end

    tab :cards do
      col(xs: 6) do
        link_to('trello',
                Rails.application.routes.url_helpers.card_path(order.idx),
                target: '_blank',
                class: 'btn btn-primary m-2')
      end
      col(xs: 6) do
        link_to('card',
                Rails.application.routes.url_helpers.image_card_path(order.idx),
                target: '_blank',
                class: 'btn btn-primary m-2')
      end
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:order).permit(:name, ...)
  # end
end

def lists_for(order)
  order.trello_card &&
    order.trello_card.board.lists.map { |list| [list.name, list.id] }
rescue Trello::Error
  []
end
