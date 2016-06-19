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

ActiveRecord::Schema.define(version: 20160619122704) do

  create_table "achievements", force: :cascade do |t|
  end

  create_table "cabinets", force: :cascade do |t|
    t.string   "phone"
    t.string   "annex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deputies", force: :cascade do |t|
    t.string  "deputy_name"
    t.integer "registration"
    t.string  "legislation_situation"
    t.integer "followers_count",       default: 0, null: false
    t.string  "image_path"
    t.integer "party_id"
    t.integer "uf_id"
    t.integer "spent_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string  "expense_description"
    t.string  "provider"
    t.string  "provider_registration"
    t.string  "ticket_number"
    t.string  "issue_date"
    t.float   "doc_value"
    t.float   "net_value"
    t.integer "spent_id"
  end

  create_table "gamifications", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "name"
    t.integer  "experience_points"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "levels", force: :cascade do |t|
    t.integer "level_number"
    t.integer "xp_min"
    t.integer "xp_max"
    t.string  "level_description"
    t.string  "image_url"
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer  "actable_id"
    t.string   "actable_type"
    t.string   "name"
    t.string   "gender"
    t.string   "email"
    t.string   "age"
    t.integer  "uf_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "quest_relationships", force: :cascade do |t|
    t.integer  "challenger_id"
    t.integer  "challenged_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "quest_relationships", ["challenged_id"], name: "index_quest_relationships_on_challenged_id"
  add_index "quest_relationships", ["challenger_id", "challenged_id"], name: "index_quest_relationships_on_challenger_id_and_challenged_id", unique: true
  add_index "quest_relationships", ["challenger_id"], name: "index_quest_relationships_on_challenger_id"

  create_table "quests", force: :cascade do |t|
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "spents", force: :cascade do |t|
    t.string "deputy_name_spent"
    t.float  "total_value"
    t.float  "office_cost"
    t.float  "gas_cost"
    t.float  "ad_cost"
    t.float  "phone_cost"
    t.float  "postal_cost"
    t.float  "vehicle_tenancy"
    t.float  "air_ticket"
  end

  create_table "ufs", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "nickname"
    t.string  "password_digest"
    t.integer "experience_points", default: 0,     null: false
    t.boolean "role_admin",        default: false, null: false
    t.integer "uf_id"
    t.integer "level_id",          default: 1
  end

end
