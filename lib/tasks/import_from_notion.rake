# frozen_string_literal: true

# encoding: UTF-8

# run as

# rake csv_model_import[file.csv,Name_of_the_Model]

require 'csv'

desc "Imports a CSV file into an ActiveRecord table"
task :csv_model_import, [:filename, :model] => [:environment] do |task,args|
  CSV.foreach(args[:filename], headers: true) do |row|
    attributes = row.to_hash
    # binding.pry
    Module.const_get(args[:model]).create(attributes)
  end
end