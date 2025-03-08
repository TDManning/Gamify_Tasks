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

ActiveRecord::Schema[8.0].define(version: 2025_03_08_170752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "points_required", null: false
    t.string "image_url"
    t.string "reward_type"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "points_awarded", default: 0
    t.boolean "completed", default: false
    t.datetime "completed_at"
    t.datetime "due_date"
    t.string "priority", default: "low"
    t.string "category"
    t.boolean "recurring", default: false
    t.string "recurrence_frequency"
    t.text "notes"
    t.string "attachment_url"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "css_class"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_rewards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "reward_id", null: false
    t.boolean "purchased", default: false
    t.boolean "unlocked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_user_rewards_on_reward_id"
    t.index ["user_id"], name: "index_user_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "points", default: 0
    t.bigint "theme_id"
    t.integer "avatar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["theme_id"], name: "index_users_on_theme_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "tasks", "users"
  add_foreign_key "user_rewards", "rewards"
  add_foreign_key "user_rewards", "users"
  add_foreign_key "users", "rewards", column: "avatar_id"
  add_foreign_key "users", "themes", on_delete: :nullify
end
