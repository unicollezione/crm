Trestle.resource(:fabrics) do
  menu do
    group :orders do
      item :fabrics, icon: "fa fa-scroll"
    end
  end

  active_storage_fields do
    [:illustration]
  end

  search do |query|
    if query
      Fabric.where('title ILIKE ?', "%#{query}%")
    else
      Fabric.all.order(created_at: :desc)
    end
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
  form do |fabric|
    text_field :title
    text_field :material
    text_field :description
    active_storage_field :illustration

  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  # end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:fabric).permit(:name, ...)
  # end
end
