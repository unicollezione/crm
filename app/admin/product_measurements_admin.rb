Trestle.resource(:product_measurements) do
  menu do
    item :product_measurements, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :range
    column :measure
    column :product
  #   column :created_at, align: :center
  #   actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |product_measurement|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:product_measurement).permit(:name, ...)
  # end
  build_instance do |attr, params|
    ProductMeasurement.new(attr).tap do |product_measurement|
      product_measurement.product_id = params[:product_id] if params[:product_id].present?
    end
  end
end
