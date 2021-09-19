Trestle.resource(:products) do
  menu do
    group :продукты do
      item :products, icon: "fa fa-tshirt"
    end
  end

  active_storage_fields do
    [:illustration]
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  form do |product|
    text_field :idx
    text_field :name
    active_storage_field :illustration
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:product).permit(:name, ...)
  # end
end
