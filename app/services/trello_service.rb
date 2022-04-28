class TrelloService
  attr_reader :order, :workroom

  def initialize( order, workroom )
    @order = order
    @workroom = workroom
  end

  def find_user_trello
    Trello::Member.find( order.customer.nickname )
  end

  def create_trello_list
    trello_list = TrelloList.create( workroom: workroom,
                                     public_id: find_user_trello.boards.first.lists.first.id
    )
    raise  trello_list.errors.full_messages.join(' ') unless trello_list.save
    trello_list
    send_order_to_trello
  end

  private

  def send_order_to_trello
    Trello::Card.create( name: "##{order.idx}",
                         list_id: order.workroom.trello_list.public_id
    )
  end
end
