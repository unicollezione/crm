# frozen_string_literal: true

# Qrcodable
#
# Qr-code as active storage
module Qrcodable
  include Rails.application.routes.url_helpers
  extend ActiveSupport::Concern

  included do
    def default_url_options
      { host: ENV['HTTP_HOST'], port: ENV['HTTP_PORT'] }
    end

    def attach_qr_code(idx = 'idx')
      raise ArgumentError unless respond_to? idx

      IO.binwrite(file_path, png(card_url).to_s)
      qr_code.attach(io: File.open(file_path), filename: filename, content_type: 'image/png')
    end

    def attach_trello_qr_code
      raise ArgumentError unless respond_to? :trello_url

      IO.binwrite(trello_file_path, png(trello_url).to_s)
      trello_qr_code.attach(io: File.open(trello_file_path), filename: filename, content_type: 'image/png')
    end

    def trello_qr_code_url
      attach_trello_qr_code unless trello_qr_code.attached?

      rails_blob_path(trello_qr_code, path_only: true)
    end

    def qr_code_url
      attach_qr_code unless qr_code.attached?

      rails_blob_path(qr_code, path_only: true)
    end

    private

    def card_url
      "https://unicrm.herokuapp.com/admin/orders/#{id}"
    end

    def trello_file_path
      [path, trello_filename(idx)].join('')
    end

    def file_path
      [path, filename(idx)].join('')
    end

    def card_idx
      "#{ENV['HTTP_HOST']}/cards/#{send(idx)}"
    end

    def png(url)
      RQRCode::QRCode.new(url, size: 6).as_png
    end

    def trello_filename(idx = 'idx')
      "trello#{idx}.png"
    end

    def filename(idx = 'idx')
      "#{idx}.png"
    end

    def path
      path = "./tmp/#{self.class.to_s.downcase}/"
      Dir.mkdir(path) unless Dir.exist?(path)

      path
    end
  end
end
