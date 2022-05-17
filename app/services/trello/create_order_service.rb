# frozen_string_literal: true

# Trello::Card.attributes
# {"id"=>"62812fcd43d2d342c9dc7c82",
#    "short_id"=>32,
#    "url"=>"https://trello.com/c/AOrd7mhX/32-test-card",
#    "short_url"=>"https://trello.com/c/AOrd7mhX",
#    "last_activity_date"=>2022-05-15 16:52:29.527 UTC,
#    "labels"=>[],
#    "badges"=>
#     {"attachmentsByType"=>{"trello"=>{"board"=>0, "card"=>0}},
#      "location"=>false,
#      "votes"=>0,
#      "viewingMemberVoted"=>false,
#      "subscribed"=>false,
#      "fogbugz"=>"",
#      "checkItems"=>0,
#      "checkItemsChecked"=>0,
#      "checkItemsEarliestDue"=>nil,
#      "comments"=>0,
#      "attachments"=>0,
#      "description"=>false,
#      "due"=>nil,
#      "dueComplete"=>false,
#      "start"=>nil},
#    "card_members"=>nil,
#    "name"=>"test card",
#    "desc"=>"",
#    "due"=>nil,
#    "due_complete"=>false,
#    "member_ids"=>[],
#    "list_id"=>"5354b9475cdad1642a9c5428",
#    "pos"=>114687,
#    "card_labels"=>[],
#    "source_card_id"=>nil,
#    "keep_from_source"=>nil,
#    "closed"=>false,
#    "board_id"=>"5354b9475cdad1642a9c5426",
#    "cover_image_id"=>nil,
#    "source_card_properties"=>nil}
module Trello
  #  class Trello::CreateOrderService
  #  @param [Order] order
  class CreateOrderService
    def initialize(order)
      raise ArgumentError, 'Workroom trello_list is missing' unless order.workroom.trello_list

      @order = order
      @workroom = order.workroom
    end

    def call
      send_order_to_trello
    end

    private

    attr_reader :order

    def send_order_to_trello
      generate_jpg
      send_attachment
    end

    def card
      @card ||= Trello::Card.create(name: "##{order.idx}", list_id: order.workroom.trello_list.list)
    end

    def jpg_name
      "#{order.idx}.jpg"
    end

    def path_for(name)
      Rails.root.join(path, name)
    end

    def trello_card_attributes
      {
        io: File.open(path_for(jpg_name)),
        filename: "#{order.idx}.jpg",
        content_type: 'image/jpg'
      }
    end

    def path
      path = "./tmp/#{self.class.to_s.downcase}/"
      Dir.mkdir(path) unless Dir.exist?(path)
      path
    end

    def pdf_name
      "#{order.idx}.pdf"
    end

    def pdf_html
      ApplicationController.render(template: 'cards/trello',
                                   assigns: {
                                     pdf: pdf_name,
                                     print_media_type: true,
                                     orientation: 'Portrait',
                                     page_size: 'A4'
                                   },
                                   layout: 'pdf',
                                   encoding: 'utf8',
                                   locals: { :@card => order })
    end

    def wicked_pdf
      WickedPdf.new.pdf_from_string("IDX #{order.idx}")
    end

    def render_pdf
      return if order.trello_pdf.attached?

      File.open(path_for(pdf_name), 'wb') { |file| file << wicked_pdf }

      order.trello_pdf.attach(io: File.open(path_for(pdf_name)),
                              filename: pdf_name)
    end

    def generate_jpg
      return if order.illustration.attached?

      render_pdf

      pdf = MiniMagick::Image.open(path_for(pdf_name))
      pdf.format('jpg')
      pdf.write(path_for(jpg_name))

      order.illustration.attach(**trello_card_attributes)
    end

    def send_attachment
      attachment = Trello::Card
                   .find(card.id)
                   .add_attachment(File.open(path_for(jpg_name), 'r'),
                                   jpg_name)

      attachment_id = JSON.parse(attachment.body)['id']

      card.update_fields(cover_image_id: attachment_id)
    end
  end
end
