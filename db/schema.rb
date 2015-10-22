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

ActiveRecord::Schema.define(version: 20151022034138) do

  create_table "games", force: :cascade do |t|
    t.string   "away_team"
    t.string   "home_team"
    t.integer  "away_score"
    t.integer  "home_score"
    t.string   "winner"
    t.integer  "week_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "season"
    t.string   "game_day"
    t.string   "game_time"
    t.string   "home_city"
    t.string   "home_img"
    t.string   "away_city"
    t.string   "away_img"
    t.string   "home_record"
    t.string   "away_record"
  end

  create_table "picks", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "away_team"
    t.integer  "home_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "week_id"
  end

  add_index "picks", ["game_id"], name: "index_picks_on_game_id"
  add_index "picks", ["user_id"], name: "index_picks_on_user_id"
  add_index "picks", ["week_id"], name: "index_picks_on_week_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_id"
    t.string   "name"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weeks", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "season"
  end

end
