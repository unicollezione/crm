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
    trello_list = TrelloList.new( workroom: workroom,
                                  public_id: find_trello_list.id
    )
    trello_list.save!
    
    send_order_to_trello
  end

  private

  def send_order_to_trello
    Trello::Card.create( name: "##{order.idx}",
                         list_id: order.workroom.trello_list.public_id,
                         desc: "Order #{order.idx}"                         
    ).add_comment("Fabric #{order.fabric.title}")
    send_attachment
  end

  def send_attachment
    find_trello_list.cards.last.add_attachment(file_path) if order.illustration.attached?
  end

  def file_path
    #url_for([ENV['TEMPORARY_ASSETS_PATH'], "#{order.idx}.jpg"].join)
    rails_blob_path(order.illustration, only_path: true)
  end
end
