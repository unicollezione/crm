module Trello
  class TrelloPdf

    def initialize(order)
      @order = order
    end

    def call
      render_pdf
    end

    private

    attr_reader :order

    def path
      path = "./tmp/#{self.class.to_s.downcase}/"
      Dir.mkdir(path) unless Dir.exist?(path)
      path
    end

    def path_for(name)
      Rails.root.join(path, name)
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
      WickedPdf.new.pdf_from_string(pdf_html)
    end

    def render_pdf
      return if order.trello_pdf.attached?

      File.open(path_for(pdf_name), 'wb') { |file| file << wicked_pdf }

      order.trello_pdf.attach(io: File.open(path_for(pdf_name)),
                              filename: pdf_name)
    end
  end
end
