# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_08_035458) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "flight_plan_steps", force: :cascade do |t|
    t.integer "flight_plan_id", null: false
    t.integer "step_number", null: false
    t.integer "duration", null: false
    t.datetime "end_time"
    t.integer "orientation", null: false
  end

  create_table "flight_plans", force: :cascade do |t|
    t.integer "satellite_id", null: false
    t.boolean "save_plan", default: false, null: false
    t.string "name"
    t.integer "current_step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newtons", force: :cascade do |t|
    t.datetime "last_updated"
  end

  create_table "satellites", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position_x", default: 0, null: false
    t.integer "position_y", default: 0, null: false
    t.integer "velocity_x", default: 0, null: false
    t.integer "velocity_y", default: 0, null: false
    t.integer "orientation", default: 0, null: false
    t.integer "thrust", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_course_id"
  end
end
