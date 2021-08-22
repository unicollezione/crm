Trestle.resource(:orders) do
  menu do
    item :orders, icon: "fa fa-star"
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
    column :коммент , ->(order) { order.comment }
    column :производство, ->(order) { order.workroom.name }
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |order|
    text_field :idx
    select :customer_id, Customer.all, {label: 'покупатель'}
    date_field :purchased_at
    select :product_id, Product.all, { label: 'продукт' }
    select :fabric_id, Fabric.all, { label: 'Ткань' }
    text_field :aasm_state
    text_field :comment
    select :workroom_id, Workroom.all, { label: 'производство'}

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
