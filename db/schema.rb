# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160701174433) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "merchant_id"
  end

  add_index "categories", ["merchant_id"], name: "index_categories_on_merchant_id"

  create_table "hours", force: :cascade do |t|
    t.integer  "day"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "closed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "merchant_id"
    t.integer  "location_hour_id"
  end

  add_index "hours", ["location_hour_id"], name: "index_hours_on_location_hour_id"
  add_index "hours", ["merchant_id"], name: "index_hours_on_merchant_id"

  create_table "location_hours", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "merchant_id"
  end

  add_index "location_hours", ["merchant_id"], name: "index_location_hours_on_merchant_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.string   "phone"
    t.string   "email"
    t.boolean  "takeout"
    t.boolean  "delivery"
    t.string   "address"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "merchant_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "printer_phone_number"
    t.string   "time_zone"
    t.integer  "hour_id"
    t.integer  "location_hour_id"
    t.string   "order_lead_time"
  end

  add_index "locations", ["hour_id"], name: "index_locations_on_hour_id"
  add_index "locations", ["location_hour_id"], name: "index_locations_on_location_hour_id"
  add_index "locations", ["merchant_id"], name: "index_locations_on_merchant_id"

  create_table "locationscategories", id: false, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "category_id", null: false
  end

  create_table "locationslocationhours", id: false, force: :cascade do |t|
    t.integer "location_id",      null: false
    t.integer "location_hour_id", null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "merchants", ["email"], name: "index_merchants_on_email", unique: true
  add_index "merchants", ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true

  create_table "option_groups", force: :cascade do |t|
    t.string   "group_name"
    t.boolean  "is_required", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "product_taxes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value",       precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "merchant_id"
  end

  add_index "product_taxes", ["merchant_id"], name: "index_product_taxes_on_merchant_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.integer  "category_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "merchant_id"
    t.integer  "product_tax_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["merchant_id"], name: "index_products_on_merchant_id"
  add_index "products", ["product_tax_id"], name: "index_products_on_product_tax_id"

  create_table "sizes", force: :cascade do |t|
    t.string   "portion_size"
    t.decimal  "size_based_price", precision: 8, scale: 2
    t.string   "size_description"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "product_id"
    t.integer  "merchant_id"
  end

  add_index "sizes", ["merchant_id"], name: "index_sizes_on_merchant_id"
  add_index "sizes", ["product_id"], name: "index_sizes_on_product_id"

end
