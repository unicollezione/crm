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

ActiveRecord::Schema.define(version: 2021_10_10_223852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "country_id", null: false
    t.bigint "city_id", null: false
    t.string "street"
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "contact_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "contact_type_id", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_type_id"], name: "index_contacts_on_contact_type_id"
    t.index ["customer_id"], name: "index_contacts_on_customer_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_measures", force: :cascade do |t|
    t.bigint "measure_id", null: false
    t.bigint "customer_id", null: false
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_measures_on_customer_id"
    t.index ["measure_id"], name: "index_customer_measures_on_measure_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "idx"
    t.string "nickname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fabric_contents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fabrics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "material"
    t.text "description"
  end

  create_table "measures", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "range"
  end

  create_table "order_measures", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "measure_id", null: false
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measure_id"], name: "index_order_measures_on_measure_id"
    t.index ["order_id"], name: "index_order_measures_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "idx"
    t.bigint "customer_id", null: false
    t.datetime "purchased_at"
    t.bigint "product_id", null: false
    t.bigint "fabric_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "aasm_state"
    t.bigint "workroom_id", null: false
    t.string "trello_url"
    t.datetime "prepared_at"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["fabric_id"], name: "index_orders_on_fabric_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["workroom_id"], name: "index_orders_on_workroom_id"
  end

  create_table "product_fabric_contents", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "fabric_content_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fabric_content_id"], name: "index_product_fabric_contents_on_fabric_content_id"
    t.index ["product_id"], name: "index_product_fabric_contents_on_product_id"
  end

  create_table "product_measurements", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "measure_id", null: false
    t.string "range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measure_id"], name: "index_product_measurements_on_measure_id"
    t.index ["product_id"], name: "index_product_measurements_on_product_id"
  end

  create_table "product_prices", force: :cascade do |t|
    t.integer "value"
    t.string "tag"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_prices_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "idx"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taylors", force: :cascade do |t|
    t.string "name"
    t.string "meta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workrooms", force: :cascade do |t|
    t.string "name"
    t.string "chat"
    t.string "status"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "customers"
  add_foreign_key "cities", "countries"
  add_foreign_key "contacts", "contact_types"
  add_foreign_key "contacts", "customers"
  add_foreign_key "customer_measures", "customers"
  add_foreign_key "customer_measures", "measures"
  add_foreign_key "order_measures", "measures"
  add_foreign_key "order_measures", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "fabrics"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "workrooms"
  add_foreign_key "product_fabric_contents", "fabric_contents"
  add_foreign_key "product_fabric_contents", "products"
  add_foreign_key "product_measurements", "measures"
  add_foreign_key "product_measurements", "products"
  add_foreign_key "product_prices", "products"
end
