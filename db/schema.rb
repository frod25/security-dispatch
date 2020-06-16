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

ActiveRecord::Schema.define(version: 2020_06_16_203319) do

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.integer "user_id"
    t.integer "dispatch_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dispatches", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "url"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "points", default: 1
    t.float "score", default: 0.0
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "dispatch_id", null: false
    t.integer "upvote", default: 0
    t.integer "downvote", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dispatch_id"], name: "index_votes_on_dispatch_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "votes", "dispatches"
  add_foreign_key "votes", "users"
end
