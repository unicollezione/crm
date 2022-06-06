Trestle.resource(:trello_list) do
  menu do
    item :trello_list, icon: 'fa fa-star'
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :workroom
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.

  form do |order|
    row do
      col(xs: 6) { select :workroom_id, Workroom.all, { label: 'производство' } }
      col { text_field :list }
      col(xs: 6) { select :board, user_boards, label: 'board' }
      order.board &&
        col(xs: 6) { select :list, board_lists(order), label: 'list' }
    end

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
  #   params.require(:trello).permit(:name, ...)
  # end
end

def user_boards
  Trello::Member.find(ENV['TRELLO_USERNAME'])
                .boards
                .map { |b| [b.name, b.id] }
end

def board_lists(order)
  order.attributes['board'] &&
    Trello::Board.find(order.board)
                 .lists
                 .map { |list| [list.name, list.id] }
end
