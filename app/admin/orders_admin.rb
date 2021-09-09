# frozen_string_literal: true

Trestle.resource(:orders) do
  menu do
    group :orders, priority: :first do
      item :orders, icon: 'fa fa-shopping-cart'
    end
  end

  collection do
    Order.order(created_at: :desc)
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
  form do |order|
    row do
      col(xs: 4) { text_field :idx }
      col(xs: 4) { date_field :purchased_at }
      col(xs: 2) do
        static_field :trello do
          link_to 'trello', order.trello_url, target: '_blank', class: 'external-link'
          # link_to order&.fabric&.material, fabrics_admin_path
        end
      end
    end
    select :customer_id, Customer.all, { label: 'покупатель' }
    select :product_id, Product.all, { label: 'продукт' }
    select :fabric_id, Fabric.all, { label: 'Ткань' }
    row do
      col(xs: 6) { select :aasm_state, ['---', 'купить', 'в_офисе', 'на_производстве'], { label: 'наличие' } }
      col(xs: 6) { select :workroom_id, Workroom.all, { label: 'производство' } }
    end

    text_field :comment
    text_field :trello_url

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
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
