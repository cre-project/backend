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

ActiveRecord::Schema.define(version: 2018_12_17_145421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "address_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer "property_id"
    t.integer "rented_unit_id"
    t.integer "sold_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "template", default: "default"
    t.integer "user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.integer "year_built"
    t.integer "number_of_stories"
    t.float "lot_size"
    t.string "apn"
    t.float "price"
    t.float "total_square_feet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "package_id"
    t.integer "user_id"
    t.integer "address_id"
  end

  create_table "property_units", force: :cascade do |t|
    t.integer "bedrooms"
    t.float "bathrooms"
    t.float "current_rent"
    t.float "potential_rent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
  end

  create_table "rented_units", force: :cascade do |t|
    t.integer "year_built"
    t.integer "bedrooms"
    t.float "bathrooms"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "current_rent"
    t.integer "user_id"
    t.integer "address_id"
    t.integer "package_id"
  end

  create_table "sold_properties", force: :cascade do |t|
    t.integer "year_built"
    t.float "sales_price"
    t.integer "num_units"
    t.float "cap_rate"
    t.float "grm"
    t.date "close_of_escrow"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "square_feet"
    t.integer "user_id"
    t.integer "address_id"
    t.integer "package_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "license_number"
    t.string "phone_number"
    t.string "title"
    t.date "subscription_expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fax"
  end

end
