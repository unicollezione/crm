# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20_210_530_154_018) do
=======
ActiveRecord::Schema.define(version: 2021_06_13_052019) do

>>>>>>> do customer with products
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.bigint 'country_id', null: false
    t.bigint 'city_id', null: false
    t.string 'street'
    t.string 'tag'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['city_id'], name: 'index_addresses_on_city_id'
    t.index ['country_id'], name: 'index_addresses_on_country_id'
    t.index ['customer_id'], name: 'index_addresses_on_customer_id'
  end

  create_table 'cities', force: :cascade do |t|
    t.string 'name'
    t.bigint 'country_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['country_id'], name: 'index_cities_on_country_id'
  end

  create_table 'contact_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'contacts', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.bigint 'contact_type_id', null: false
    t.string 'value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['contact_type_id'], name: 'index_contacts_on_contact_type_id'
    t.index ['customer_id'], name: 'index_contacts_on_customer_id'
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'customer_measures', force: :cascade do |t|
    t.bigint 'measure_id', null: false
    t.bigint 'customer_id', null: false
    t.string 'value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_customer_measures_on_customer_id'
    t.index ['measure_id'], name: 'index_customer_measures_on_measure_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.integer 'idx'
    t.string 'nickname'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'fabrics', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'measures', force: :cascade do |t|
    t.string 'tag'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'idx'
    t.bigint 'customer_id', null: false
    t.datetime 'purchased_at'
    t.bigint 'product_id', null: false
    t.bigint 'fabric_id', null: false
    t.string 'comment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'aasm_state'
    t.index ['customer_id'], name: 'index_orders_on_customer_id'
    t.index ['fabric_id'], name: 'index_orders_on_fabric_id'
    t.index ['product_id'], name: 'index_orders_on_product_id'
  end

  create_table 'product_prices', force: :cascade do |t|
    t.integer 'value'
    t.string 'tag'
    t.bigint 'product_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['product_id'], name: 'index_product_prices_on_product_id'
  end

<<<<<<< HEAD
  create_table 'products', force: :cascade do |t|
    t.integer 'idx'
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
=======
  create_table "products", force: :cascade do |t|
    t.integer "idx"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id"
>>>>>>> do customer with products
  end

  create_table 'taylors', force: :cascade do |t|
    t.string 'name'
    t.string 'meta'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'addresses', 'cities'
  add_foreign_key 'addresses', 'countries'
  add_foreign_key 'addresses', 'customers'
  add_foreign_key 'cities', 'countries'
  add_foreign_key 'contacts', 'contact_types'
  add_foreign_key 'contacts', 'customers'
  add_foreign_key 'customer_measures', 'customers'
  add_foreign_key 'customer_measures', 'measures'
  add_foreign_key 'orders', 'customers'
  add_foreign_key 'orders', 'fabrics'
  add_foreign_key 'orders', 'products'
  add_foreign_key 'product_prices', 'products'
end
