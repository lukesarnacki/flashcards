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

ActiveRecord::Schema.define(version: 20170502094905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.uuid     "client_id",  null: false
    t.string   "token_hash", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_auth_tokens_on_client_id", using: :btree
    t.index ["user_id"], name: "index_auth_tokens_on_user_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "status"
    t.string   "front_text"
    t.string   "front_subtext"
    t.string   "back_text"
    t.string   "back_subtext"
    t.integer  "deck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id", using: :btree
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.string   "front_language"
    t.string   "back_language"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_decks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "auth_tokens", "users"
end
