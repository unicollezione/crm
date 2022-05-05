class TrelloService
  include Rails.application.routes.url_helpers

  attr_reader :order, :workroom

  def initialize( order )
    @order = order
    @workroom = order.workroom
  end

  def find_trello_list
    Trello::List.find("6260e2d833a6050c5317d3f6")
  end

  def create_trello_list
    trello_list = TrelloList.create( workroom: workroom,
                                     public_id: find_trello_list.id
    )
    raise  trello_list.errors.full_messages.join(' ') unless trello_list.save
    
    send_order_to_trello
  end

  private

  def send_order_to_trello
    Trello::Card.create( name: "##{order.idx}",
                         list_id: order.workroom.trello_list.public_id                         
    )
    send_attachmen_file
  end

  def send_attachmen_file
    find_trello_list.cards.last.add_attachment(File.open(file_path))
  end

  def file_path
    [ENV['TEMPORARY_ASSETS_PATH'], "#{order.idx}.jpg"].join # так работает 
    #rails_blob_path(order.illustration, disposition: "attachment", path_only: true)  а так нет((
  end
end
