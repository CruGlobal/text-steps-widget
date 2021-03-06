# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_17_203957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "step_set_subscriptions", force: :cascade do |t|
    t.string "execution_sid", null: false
    t.string "status", default: "pending", null: false
    t.bigint "step_set_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["step_set_id"], name: "index_step_set_subscriptions_on_step_set_id"
  end

  create_table "step_sets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "body"
    t.string "help_text"
    t.bigint "step_set_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["step_set_id"], name: "index_steps_on_step_set_id"
  end

end
