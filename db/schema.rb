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

ActiveRecord::Schema.define(version: 2019_08_22_131446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "full_texts", force: :cascade do |t|
    t.string "title"
    t.integer "percentage", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_full_texts_on_user_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.bigint "text_paragraph_id"
    t.bigint "game_id"
    t.integer "number_of_inputs"
    t.integer "number_of_right_inputs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_sessions_on_game_id"
    t.index ["text_paragraph_id"], name: "index_game_sessions_on_text_paragraph_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_paragraphs", force: :cascade do |t|
    t.bigint "full_text_id"
    t.text "content"
    t.integer "order_number"
    t.boolean "done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["full_text_id"], name: "index_text_paragraphs_on_full_text_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "full_texts", "users"
  add_foreign_key "game_sessions", "games"
  add_foreign_key "game_sessions", "text_paragraphs"
  add_foreign_key "text_paragraphs", "full_texts"
end
