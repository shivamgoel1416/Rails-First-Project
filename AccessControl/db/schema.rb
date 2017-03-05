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

ActiveRecord::Schema.define(version: 20170301070759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: :cascade do |t|
    t.string   "page_name"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_pages_on_role_id", using: :btree
  end

  create_table "role_wise_pages", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_role_wise_pages_on_page_id", using: :btree
    t.index ["role_id"], name: "index_role_wise_pages_on_role_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role_id"
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "pages", "roles"
  add_foreign_key "role_wise_pages", "pages"
  add_foreign_key "role_wise_pages", "roles"
  add_foreign_key "users", "roles"
end
