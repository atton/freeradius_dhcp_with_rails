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

ActiveRecord::Schema.define(version: 20151019091708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ip_addresses", force: :cascade do |t|
    t.integer  "address",     default: 0,  null: false
    t.string   "mac_address", default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "radius_reply_informations", force: :cascade do |t|
    t.string   "op",               default: "=",                    null: false
    t.string   "value",            default: "",                     null: false
    t.string   "radius_attribute", default: "DHCP-Your-IP-Address", null: false
    t.string   "mac_address",      default: "",                     null: false
    t.integer  "ip_address_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "radius_reply_informations", ["ip_address_id"], name: "index_radius_reply_informations_on_ip_address_id", using: :btree
  add_index "radius_reply_informations", ["mac_address", "radius_attribute"], name: "radius_reply_index", using: :btree

  add_foreign_key "radius_reply_informations", "ip_addresses"
end
