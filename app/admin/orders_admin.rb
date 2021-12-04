# frozen_string_literal: true

Trestle.resource(:orders) do
  menu do
    group :orders do
      item :orders, icon: 'fa fa-shopping-cart', priority: :first
    end
  end

  search do |query|
    if query
      Order.joins(:customer).where('customers.nickname ILIKE ?', "%#{query}%")
           .or(Order.joins(:customer).where('orders.idx = ?', query.to_i))
           .order(created_at: :desc)
    else
      Order.all.order(created_at: :desc)
    end
  end
  active_storage_fields do
    [:illustration]
  end

  collection do
    Order.order(created_at: :desc).with_attached_illustration
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
        table order.product.product_measurements, admin: :product_measurements do
          column :measure
          column :range
        end unless order.new_record?
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
      col { datetime_field :prepared_at}
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
