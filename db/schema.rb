# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_29_141449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "address_id"
    t.index ["address_id"], name: "index_companies_on_address_id"
  end

  create_table "operating_statement_fields", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.float "current_value"
    t.float "potential_value"
    t.boolean "is_income", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "operating_statement_id"
    t.index ["operating_statement_id"], name: "index_operating_statement_fields_on_operating_statement_id"
  end

  create_table "operating_statements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_rented_units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "package_id"
    t.uuid "rented_unit_id"
    t.index ["package_id"], name: "index_package_rented_units_on_package_id"
    t.index ["rented_unit_id"], name: "index_package_rented_units_on_rented_unit_id"
  end

  create_table "package_sold_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "package_id"
    t.uuid "sold_property_id"
    t.index ["package_id"], name: "index_package_sold_properties_on_package_id"
    t.index ["sold_property_id"], name: "index_package_sold_properties_on_sold_property_id"
  end

  create_table "packages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "template", default: "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "property_id"
    t.uuid "user_id"
    t.index ["property_id"], name: "index_packages_on_property_id"
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "year_built"
    t.integer "number_of_stories"
    t.float "lot_size"
    t.string "apn"
    t.float "price", null: false
    t.float "total_square_feet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "package_id"
    t.uuid "user_id"
    t.uuid "address_id", null: false
    t.index ["address_id"], name: "index_properties_on_address_id"
    t.index ["package_id"], name: "index_properties_on_package_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "bedrooms", null: false
    t.float "bathrooms", null: false
    t.float "current_rent", null: false
    t.float "potential_rent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "property_id"
    t.index ["property_id"], name: "index_property_units_on_property_id"
  end

  create_table "rented_units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "year_built"
    t.integer "bedrooms", null: false
    t.float "bathrooms"
    t.string "image_url"
    t.float "current_rent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.uuid "address_id"
    t.index ["address_id"], name: "index_rented_units_on_address_id"
    t.index ["user_id"], name: "index_rented_units_on_user_id"
  end

  create_table "sold_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "year_built"
    t.float "sales_price"
    t.integer "num_units"
    t.float "cap_rate"
    t.float "grm"
    t.date "close_of_escrow"
    t.string "image_url"
    t.float "square_feet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.uuid "address_id"
    t.index ["address_id"], name: "index_sold_properties_on_address_id"
    t.index ["user_id"], name: "index_sold_properties_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "license_number"
    t.string "phone_number"
    t.string "title"
    t.date "subscription_expiration"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "picture_url"
  end

  add_foreign_key "companies", "addresses"
  add_foreign_key "operating_statement_fields", "operating_statements"
  add_foreign_key "package_rented_units", "packages"
  add_foreign_key "package_rented_units", "rented_units"
  add_foreign_key "package_sold_properties", "packages"
  add_foreign_key "package_sold_properties", "sold_properties"
  add_foreign_key "packages", "properties"
  add_foreign_key "packages", "users"
  add_foreign_key "properties", "addresses"
  add_foreign_key "properties", "packages"
  add_foreign_key "properties", "users"
  add_foreign_key "property_units", "properties"
  add_foreign_key "rented_units", "addresses"
  add_foreign_key "rented_units", "users"
  add_foreign_key "sold_properties", "addresses"
  add_foreign_key "sold_properties", "users"
end
