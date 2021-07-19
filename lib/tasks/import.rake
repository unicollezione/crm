# frozen_string_literal: true

# run as
# bundle exec rake db:import_csv

require 'csv'
namespace :db do
  desc 'Import workrooms from csv file'
  task import_csv: [:environment] do
    file = 'tmp/work.csv'

    CSV.foreach(file, headers: true) do |row|
      puts row.to_hash
      puts
      w_name = row[0]
      w_chat = row[1]
      w_status = row[2]
      w_link = row[3]
      puts w_name
      puts w_chat
      puts w_status
      puts w_link
      Workroom.create!(name: w_name, chat: w_chat, status: w_status, link: w_link)
    end
  end
end
