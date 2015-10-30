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

ActiveRecord::Schema.define(version: 20151029183526) do

  create_table "admins", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "role"
    t.string "session_token"
  end

  create_table "vendors", force: :cascade do |t|
    t.integer "number_i_booth"
    t.integer "number_o_booth"
    t.boolean "booth_pref"
    t.integer "booth_cost"
    t.boolean "electric"
    t.boolean "internet"
    t.boolean "forklift"
    t.integer "ext_chairs"
    t.integer "ext_tables"
    t.integer "service_cost"
    t.string  "company_name"
    t.string  "product"
    t.string  "contact_name"
    t.string  "address_street"
    t.string  "address_city"
    t.string  "address_state"
    t.integer "address_zip"
    t.string  "phone"
    t.string  "fax"
    t.boolean "authorize_sig"
    t.string  "authorize_title"
    t.date    "authorize_date"
    t.boolean "inovice_sent"
    t.boolean "bill_paid"
    t.boolean "confirmation_sent"
    t.integer "vendor_id"
    t.boolean "session_state"
    t.boolean "admin"
  end

end
