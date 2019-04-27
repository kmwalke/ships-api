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

ActiveRecord::Schema.define(version: 2019_04_27_135760) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "access_level"
    t.index ["access_level"], name: "index_groups_on_access_level", unique: true
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "satellites", force: :cascade do |t|
    t.string "name"
    t.bigint "pos_x"
    t.bigint "pos_y"
    t.bigint "pos_z"
    t.integer "vel_x"
    t.integer "vel_y"
    t.integer "vel_z"
    t.datetime "last_updated"
    t.integer "thrust_x"
    t.integer "thrust_y"
    t.integer "thrust_z"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.string "email"
    t.string "password_digest"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["name"], name: "index_users_on_name"
    t.index ["token"], name: "index_users_on_token"
  end

  add_foreign_key "users", "groups"
end
