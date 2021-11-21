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

      IO.binwrite(file_path, png(idx).to_s)
      qr_code.attach(io: File.open(file_path), filename: filename, content_type: 'image/png')
    end

    def qr_code_url
      rails_blob_path(qr_code, path_only: true)
    end

    private

    def file_path
      [path, filename].join('')
    end

    def png(idx = 'idx')
      RQRCode::QRCode.new("#{ENV['HTTP_HOST']}/cards/#{send(idx)}", size: 6).as_png
    end

    def filename(idx = 'idx')
      "#{send(idx)}.png"
    end

    def path
      "./tmp/qr/#{self.class.to_s.downcase}/"
    end
  end
end
