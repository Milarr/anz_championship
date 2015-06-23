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

ActiveRecord::Schema.define(version: 20150620061141) do

  create_table "game_matches", force: :cascade do |t|
    t.integer  "year"
    t.integer  "round"
    t.datetime "date"
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "home_score"
    t.integer  "away_score"
    t.string   "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_matches_and_teams", id: false, force: :cascade do |t|
    t.integer "game_match_id"
    t.integer "team_id"
  end

  add_index "game_matches_and_teams", ["game_match_id"], name: "index_game_matches_and_teams_on_game_match_id"
  add_index "game_matches_and_teams", ["team_id"], name: "index_game_matches_and_teams_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
