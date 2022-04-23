class TrelloService
  attr_reader :order, :workroom

  def initialize(order, workroom)
    @order = order
    @workroom = workroom
  end

  def find_workroom
    Trello::Member.find("#{workroom}")
  end

  def create_trello_list
    TrelloList.create(order: order, 
                      workroom: order.workroom, 
                      public_id: find_workroom.boards.first.lists.first.id)
  end

  def send_order_to_trello
    Trello::Card.create( 
                      name: "##{idx}", 
                      list_id: order.workroom.trello_list.public_id
    )
  end
end