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

ActiveRecord::Schema.define(version: 20160110083404) do

  create_table "register_infos", force: :cascade do |t|
    t.string   "company_name",                limit: 60,                                        null: false
    t.string   "legal_code",                  limit: 60,                                        null: false
    t.string   "address",                     limit: 60
    t.string   "legaler",                     limit: 60
    t.string   "union_company_name",          limit: 60
    t.integer  "logistics_level",                        precision: 38
    t.string   "project_manager",             limit: 60
    t.string   "pm_phone",                    limit: 20
    t.string   "pm_fax",                      limit: 20
    t.string   "pm_mobile",                   limit: 20
    t.decimal  "capital",                                precision: 15, scale: 2, default: 0.0
    t.datetime "register_date"
    t.integer  "ec_typee",                               precision: 38
    t.decimal  "income_2012",                            precision: 15, scale: 2, default: 0.0
    t.decimal  "profit_2012",                            precision: 15, scale: 2, default: 0.0
    t.integer  "employees_count_2012",                   precision: 38,           default: 0
    t.decimal  "asset_2012",                             precision: 15, scale: 2, default: 0.0
    t.decimal  "pure_asset_2012",                        precision: 15, scale: 2, default: 0.0
    t.decimal  "tax_2011",                               precision: 15, scale: 2, default: 0.0
    t.decimal  "tax_2012",                               precision: 15, scale: 2, default: 0.0
    t.decimal  "profit_pure_asset_2012",                 precision: 15, scale: 2, default: 0.0
    t.decimal  "profit_flow_asset_2012",                 precision: 15, scale: 2, default: 0.0
    t.decimal  "rate_balance_2012",                      precision: 15, scale: 2, default: 0.0
    t.string   "project_name",                limit: 60
    t.text     "project_context"
    t.text     "project_kpi"
    t.string   "project_belongs"
    t.datetime "project_begin_date"
    t.datetime "project_end_date"
    t.decimal  "project_sum_invest",                     precision: 15, scale: 2, default: 0.0
    t.decimal  "project_sum_invest_self",                precision: 15, scale: 2, default: 0.0
    t.decimal  "project_sum_invest_loan",                precision: 15, scale: 2, default: 0.0
    t.decimal  "project_sum_apply",                      precision: 15, scale: 2, default: 0.0
    t.integer  "project_apply_type",                     precision: 38
    t.decimal  "project_already_invest_2012",            precision: 15, scale: 2, default: 0.0
    t.decimal  "project_already_invest_2013",            precision: 15, scale: 2, default: 0.0
    t.integer  "is_important",                           precision: 38,           default: 0
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.string   "attach_1_file_name"
    t.string   "attach_1_content_type"
    t.integer  "attach_1_file_size",                     precision: 38
    t.datetime "attach_1_updated_at"
    t.string   "attach_2_file_name"
    t.string   "attach_2_content_type"
    t.integer  "attach_2_file_size",                     precision: 38
    t.datetime "attach_2_updated_at"
    t.string   "attach_3_file_name"
    t.string   "attach_3_content_type"
    t.integer  "attach_3_file_size",                     precision: 38
    t.datetime "attach_3_updated_at"
    t.string   "attach_4_file_name"
    t.string   "attach_4_content_type"
    t.integer  "attach_4_file_size",                     precision: 38
    t.datetime "attach_4_updated_at"
    t.string   "attach_5_file_name"
    t.string   "attach_5_content_type"
    t.integer  "attach_5_file_size",                     precision: 38
    t.datetime "attach_5_updated_at"
    t.string   "attach_6_file_name"
    t.string   "attach_6_content_type"
    t.integer  "attach_6_file_size",                     precision: 38
    t.datetime "attach_6_updated_at"
    t.string   "attach_7_file_name"
    t.string   "attach_7_content_type"
    t.integer  "attach_7_file_size",                     precision: 38
    t.datetime "attach_7_updated_at"
    t.string   "attach_8_file_name"
    t.string   "attach_8_content_type"
    t.integer  "attach_8_file_size",                     precision: 38
    t.datetime "attach_8_updated_at"
    t.string   "attach_9_file_name"
    t.string   "attach_9_content_type"
    t.integer  "attach_9_file_size",                     precision: 38
    t.datetime "attach_9_updated_at"
    t.string   "attach_10_file_name"
    t.string   "attach_10_content_type"
    t.integer  "attach_10_file_size",                    precision: 38
    t.datetime "attach_10_updated_at"
    t.integer  "user_id",                                precision: 38
  end

  create_table "t_basket_current_match", primary_key: "match_id", force: :cascade do |t|
    t.integer  "match_status", limit: 2,  precision: 2, null: false
    t.string   "match_time",   limit: 10
    t.integer  "home_score",   limit: 3,  precision: 3, null: false
    t.integer  "guest_score",  limit: 3,  precision: 3, null: false
    t.integer  "home_score1",  limit: 3,  precision: 3
    t.integer  "guest_score1", limit: 3,  precision: 3
    t.integer  "home_score2",  limit: 3,  precision: 3
    t.integer  "guest_score2", limit: 3,  precision: 3
    t.integer  "home_score3",  limit: 3,  precision: 3
    t.integer  "guest_score3", limit: 3,  precision: 3
    t.integer  "home_score4",  limit: 3,  precision: 3
    t.integer  "guest_score4", limit: 3,  precision: 3
    t.datetime "data_time",                             null: false
  end

  create_table "t_basket_league", primary_key: "league_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false
    t.string  "tr_name",    limit: 50
    t.string  "en_name",    limit: 50
    t.integer "country_id", limit: 4,  precision: 4, null: false
  end

  create_table "t_basket_league_rankings", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 14,  precision: 14,           null: false
    t.integer "team_id",   limit: 14,  precision: 14,           null: false
    t.boolean "odds_type", limit: nil,                          null: false
    t.integer "games",     limit: 3,   precision: 3
    t.integer "win",       limit: 3,   precision: 3
    t.integer "lose",      limit: 3,   precision: 3
    t.decimal "get",                   precision: 4,  scale: 1
    t.decimal "miss",                  precision: 4,  scale: 1
    t.integer "ranking",   limit: 3,   precision: 3
  end

  create_table "t_basket_match", primary_key: "match_id", force: :cascade do |t|
    t.integer  "league_id",    limit: 14, precision: 14, null: false
    t.datetime "match_time",                             null: false
    t.integer  "team1_id",     limit: 14, precision: 14, null: false
    t.integer  "team2_id",     limit: 14, precision: 14, null: false
    t.integer  "home_score",   limit: 3,  precision: 3,  null: false
    t.integer  "guest_score",  limit: 3,  precision: 3,  null: false
    t.integer  "home_score1",  limit: 3,  precision: 3
    t.integer  "guest_score1", limit: 3,  precision: 3
    t.integer  "home_score2",  limit: 3,  precision: 3
    t.integer  "guest_score2", limit: 3,  precision: 3
    t.integer  "home_score3",  limit: 3,  precision: 3
    t.integer  "guest_score3", limit: 3,  precision: 3
    t.integer  "home_score4",  limit: 3,  precision: 3
    t.integer  "guest_score4", limit: 3,  precision: 3
    t.datetime "data_time",                              null: false
  end

  create_table "t_basket_odds_asian", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false
    t.integer  "company_id", limit: 3,   precision: 3,            null: false
    t.datetime "data_time",                                       null: false
    t.boolean  "odds_type",  limit: nil,                          null: false
    t.decimal  "home",                   precision: 6,  scale: 3
    t.decimal  "goal",                   precision: 6,  scale: 3
    t.decimal  "away",                   precision: 6,  scale: 3
  end

  create_table "t_basket_odds_ball", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false
    t.integer  "company_id", limit: 3,   precision: 3,            null: false
    t.datetime "data_time",                                       null: false
    t.boolean  "odds_type",  limit: nil,                          null: false
    t.decimal  "over",                   precision: 6,  scale: 3
    t.decimal  "goal",                   precision: 6,  scale: 3
    t.decimal  "under",                  precision: 6,  scale: 3
  end

  create_table "t_basket_odds_europe", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false
    t.integer  "company_id", limit: 3,   precision: 3,            null: false
    t.datetime "data_time",                                       null: false
    t.boolean  "odds_type",  limit: nil,                          null: false
    t.decimal  "hw",                     precision: 6,  scale: 3
    t.decimal  "aw",                     precision: 6,  scale: 3
  end

  create_table "t_basket_team", primary_key: "team_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false
    t.string "tr_name", limit: 50
    t.string "en_name", limit: 50
  end

  create_table "t_company", primary_key: "company_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false
    t.string "en_name", limit: 50
  end

  create_table "t_continents", primary_key: "continents_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false
    t.string  "en_name",    limit: 50
    t.integer "sort_value", limit: 2,  precision: 2
  end

  create_table "t_country", primary_key: "country_id", force: :cascade do |t|
    t.integer "continents_id", limit: 2,  precision: 2, null: false
    t.string  "cn_name",       limit: 50,               null: false
    t.string  "en_name",       limit: 50
    t.integer "sort_value",    limit: 2,  precision: 2
  end

  create_table "t_current_match", primary_key: "match_id", force: :cascade do |t|
    t.boolean  "match_status",      limit: nil,               null: false
    t.datetime "first_time"
    t.datetime "second_time"
    t.integer  "home_score",        limit: 3,   precision: 3, null: false
    t.integer  "guest_score",       limit: 3,   precision: 3, null: false
    t.integer  "home_red_card",     limit: 2,   precision: 2
    t.integer  "guest_red_card",    limit: 2,   precision: 2
    t.integer  "home_yellow_card",  limit: 2,   precision: 2
    t.integer  "guest_yellow_card", limit: 2,   precision: 2
    t.datetime "data_time",                                   null: false
  end

  create_table "t_event", id: false, force: :cascade do |t|
    t.integer "match_id",     limit: 14,  precision: 14, null: false
    t.integer "event_type",   limit: 2,   precision: 2,  null: false
    t.string  "player_name1", limit: 50
    t.string  "player_name2", limit: 50
    t.integer "happen_time",  limit: 3,   precision: 3,  null: false
    t.boolean "ishome",       limit: nil,                null: false
  end

  create_table "t_league", primary_key: "league_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false
    t.string  "tr_name",    limit: 50
    t.string  "en_name",    limit: 50
    t.integer "country_id", limit: 4,  precision: 4, null: false
  end

  create_table "t_league_rankings", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 14,  precision: 14, null: false
    t.integer "team_id",   limit: 14,  precision: 14, null: false
    t.boolean "odds_type", limit: nil,                null: false
    t.integer "games",     limit: 3,   precision: 3
    t.integer "win",       limit: 3,   precision: 3
    t.integer "draw",      limit: 3,   precision: 3
    t.integer "lose",      limit: 3,   precision: 3
    t.integer "get",       limit: 3,   precision: 3
    t.integer "miss",      limit: 3,   precision: 3
    t.integer "pts",       limit: 3,   precision: 3
    t.integer "ranking",   limit: 3,   precision: 3
  end

  create_table "t_lineup", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 14,  precision: 14, null: false
    t.integer "team_id",   limit: 14,  precision: 14, null: false
    t.boolean "odds_type", limit: nil,                null: false
    t.integer "shirt_num", limit: 3,   precision: 3,  null: false
    t.string  "cn_name",   limit: 100,                null: false
    t.string  "tr_name",   limit: 100
    t.string  "en_name",   limit: 100
  end

  create_table "t_match", primary_key: "match_id", force: :cascade do |t|
    t.integer  "league_id",         limit: 14,  precision: 14,                       null: false
    t.datetime "match_time",                                                         null: false
    t.integer  "team1_id",          limit: 14,  precision: 14,                       null: false
    t.integer  "team2_id",          limit: 14,  precision: 14,                       null: false
    t.integer  "home_score",        limit: 3,   precision: 3,                        null: false
    t.integer  "guest_score",       limit: 3,   precision: 3,                        null: false
    t.integer  "half_home_score",   limit: 3,   precision: 3
    t.integer  "half_guest_score",  limit: 3,   precision: 3
    t.boolean  "match_level",       limit: nil
    t.datetime "data_time",                                                          null: false
    t.integer  "home_red_card",     limit: 2,   precision: 2,            default: 0, null: false
    t.integer  "guest_red_card",    limit: 2,   precision: 2,            default: 0, null: false
    t.integer  "home_yellow_card",  limit: 2,   precision: 2,            default: 0, null: false
    t.integer  "guest_yellow_card", limit: 2,   precision: 2,            default: 0, null: false
    t.decimal  "odds_value",                    precision: 7,  scale: 3
    t.boolean  "odds_result",       limit: nil
  end

  create_table "t_odds_asian", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false
    t.integer  "company_id", limit: 3,   precision: 3,            null: false
    t.datetime "data_time",                                       null: false
    t.boolean  "odds_type",  limit: nil,                          null: false
    t.decimal  "home",                   precision: 6,  scale: 3
    t.decimal  "goal",                   precision: 6,  scale: 3
    t.decimal  "away",                   precision: 6,  scale: 3
  end

  create_table "t_odds_ball", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false
    t.integer  "company_id", limit: 3,   precision: 3,            null: false
    t.datetime "data_time",                                       null: false
    t.boolean  "odds_type",  limit: nil,                          null: false
    t.decimal  "over",                   precision: 6,  scale: 3
    t.decimal  "goal",                   precision: 6,  scale: 3
    t.decimal  "under",                  precision: 6,  scale: 3
  end

  create_table "t_odds_europe", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false
    t.integer  "company_id", limit: 3,   precision: 3,            null: false
    t.datetime "data_time",                                       null: false
    t.boolean  "odds_type",  limit: nil,                          null: false
    t.decimal  "hw",                     precision: 6,  scale: 3
    t.decimal  "st",                     precision: 6,  scale: 3
    t.decimal  "aw",                     precision: 6,  scale: 3
  end

  create_table "t_team", primary_key: "team_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false
    t.string "tr_name", limit: 50
    t.string "en_name", limit: 50
  end

  create_table "t_user", primary_key: "user_id", force: :cascade do |t|
    t.string  "user_name", limit: 50,  null: false
    t.string  "password",  limit: 100, null: false
    t.string  "phone",     limit: 20
    t.boolean "status",    limit: nil
    t.string  "email",     limit: 50
  end

  create_table "t_user_favorite", id: false, force: :cascade do |t|
    t.integer  "user_id",       limit: 14,  precision: 14, null: false
    t.integer  "match_id",      limit: 14,  precision: 14, null: false
    t.datetime "favorite_time",                            null: false
    t.boolean  "type",          limit: nil
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 60,                 default: ""
    t.string   "encrypted_password",                                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      precision: 38, default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone",                  limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               limit: nil,                default: false
    t.string   "user_name",              limit: 30,                                 null: false
    t.boolean  "status",                 limit: nil,                default: true,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_users_reset_password_token", unique: true

end
