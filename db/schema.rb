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
  enable_extension "uuid-ossp"

  create_table "auth_tokens", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "client_id",  null: false
    t.string   "token_hash", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_auth_tokens_on_client_id", using: :btree
    t.index ["user_id"], name: "index_auth_tokens_on_user_id", using: :btree
  end

  create_table "cards", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "status"
    t.string   "front_text",    null: false
    t.string   "front_subtext"
    t.string   "back_text",     null: false
    t.string   "back_subtext"
    t.uuid     "deck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id", using: :btree
  end

  create_table "decks", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "front_language", null: false
    t.string   "back_language",  null: false
    t.uuid     "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_decks_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "screen_name",     null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

  add_foreign_key "auth_tokens", "users"
  add_foreign_key "cards", "decks"
  add_foreign_key "decks", "users"
end
