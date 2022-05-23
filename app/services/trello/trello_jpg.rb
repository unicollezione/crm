module Trello
  class TrelloJpg

    def initialize(order)
      @order = order
    end

    def call
      generate_jpg
    end

    private

    attr_reader :order

    def trello_card_attributes
      {
        io: File.open(path_for(jpg_name)),
        filename: "#{order.idx}.jpg",
        content_type: 'image/jpg'
      }
    end

    def generate_jpg
      return if order.illustration.attached?

      TrelloPdf.new(order).call

      pdf = MiniMagick::Image.open(order.trello_pdf)
      pdf.format('jpg')
      pdf.write(path_for(jpg_name))

      order.illustration.attach(**trello_card_attributes)
      path_for(jpg_name)
    end

    def jpg_name
      "#{order.idx}.jpg"
    end

    def path
      path = "./tmp/#{self.class.to_s.downcase}/"
      Dir.mkdir(path) unless Dir.exist?(path)
      path
    end

    def path_for(name)
      Rails.root.join(path, name)
    end
  end
end
