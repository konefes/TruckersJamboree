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

ActiveRecord::Schema.define(version: 20151201025100) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "admins", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "role"
    t.string "session_token"
  end

  create_table "vendors", force: :cascade do |t|
    t.integer "number_i_booth"
    t.integer "booth_i_cost"
    t.integer "number_o_booth"
    t.integer "booth_o_cost"
    t.boolean "booth_pref"
    t.integer "length"
    t.integer "width"
    t.integer "booth_cost"
    t.integer "electric"
    t.integer "electric_cost"
    t.integer "ext_chairs"
    t.integer "chair_cost"
    t.integer "ext_tables"
    t.integer "table_cost"
    t.integer "service_cost"
    t.integer "total_cost"
    t.string  "company_name"
    t.string  "product"
    t.string  "contact_name"
    t.string  "contact_title"
    t.string  "address_street"
    t.string  "address_city"
    t.string  "address_state"
    t.string  "address_zip"
    t.string  "phone"
    t.string  "fax"
    t.string  "authorize_sig"
    t.string  "authorize_title"
    t.string  "authorize_date"
    t.boolean "inovice_sent"
    t.boolean "bill_paid"
    t.boolean "confirmation_sent"
    t.integer "vendor_id"
    t.boolean "session_state"
    t.boolean "admin"
    t.string  "email"
    t.string  "custom_description"
    t.string  "service_description"
  end

end
