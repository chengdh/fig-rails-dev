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

ActiveRecord::Schema.define(version: 20150504153457) do

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

  create_table "t_basket_league", comment: "????", primary_key: "league_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false, comment: "????"
    t.string  "tr_name",    limit: 50,                            comment: "????"
    t.string  "en_name",    limit: 50,                            comment: "????"
    t.integer "country_id", limit: 4,  precision: 4,              comment: "????ID"
  end

  create_table "t_basket_league_rankings", comment: "????????", id: false, force: :cascade do |t|
    t.integer "team_id",  limit: 14,  precision: 14,           null: false, comment: "???ID"
    t.boolean "type",     limit: nil,                          null: false, comment: "???1???2???3???4???"
    t.integer "games",    limit: 3,   precision: 3,                         comment: "?"
    t.integer "win",      limit: 3,   precision: 3,                         comment: "?"
    t.integer "lose",     limit: 3,   precision: 3,                         comment: "?"
    t.decimal "get",                  precision: 4,  scale: 1,              comment: "?"
    t.decimal "miss",                 precision: 4,  scale: 1,              comment: "?"
    t.integer "ranking",  limit: 3,   precision: 3,                         comment: "??"
    t.integer "match_id", limit: 14,  precision: 14,           null: false, comment: "??ID"
  end

  create_table "t_basket_match", comment: "????", primary_key: "match_id", force: :cascade do |t|
    t.integer  "league_id",    limit: 14, precision: 14, null: false, comment: "????ID"
    t.datetime "match_time",                             null: false, comment: "????"
    t.integer  "team1_id",     limit: 14, precision: 14, null: false, comment: "??ID"
    t.integer  "team2_id",     limit: 14, precision: 14, null: false, comment: "??ID"
    t.integer  "home_score",   limit: 3,  precision: 3,  null: false, comment: "????"
    t.integer  "guest_score",  limit: 3,  precision: 3,  null: false, comment: "????"
    t.integer  "home_score1",  limit: 3,  precision: 3,               comment: "???????"
    t.integer  "guest_score1", limit: 3,  precision: 3,               comment: "???????"
    t.integer  "home_score2",  limit: 3,  precision: 3,               comment: "???????"
    t.integer  "guest_score2", limit: 3,  precision: 3,               comment: "???????"
    t.integer  "home_score3",  limit: 3,  precision: 3,               comment: "???????"
    t.integer  "guest_score3", limit: 3,  precision: 3,               comment: "???????"
    t.integer  "home_score4",  limit: 3,  precision: 3,               comment: "???????"
    t.integer  "guest_score4", limit: 3,  precision: 3,               comment: "???????"
    t.datetime "data_time",                              null: false, comment: "??????"
  end

  create_table "t_basket_odds_asian", comment: "????", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false, comment: "??ID"
    t.integer  "company_id", limit: 3,   precision: 3,            null: false, comment: "??ID"
    t.datetime "data_time",                                       null: false, comment: "????"
    t.boolean  "type",       limit: nil,                          null: false, comment: "?????1????2?????3????"
    t.decimal  "home",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "goal",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "away",                   precision: 6,  scale: 3,              comment: "??"
  end

  create_table "t_basket_odds_ball", comment: "???????", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false, comment: "??ID"
    t.integer  "company_id", limit: 3,   precision: 3,            null: false, comment: "??ID"
    t.datetime "data_time",                                       null: false, comment: "????"
    t.boolean  "type",       limit: nil,                          null: false, comment: "?????1????2?????3????"
    t.decimal  "over",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "goal",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "under",                  precision: 6,  scale: 3,              comment: "??"
  end

  create_table "t_basket_odds_europe", comment: "??????", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false, comment: "??ID"
    t.integer  "company_id", limit: 3,   precision: 3,            null: false, comment: "??ID"
    t.datetime "data_time",                                       null: false, comment: "????"
    t.boolean  "type",       limit: nil,                          null: false, comment: "?????1????2?????3????"
    t.decimal  "hw",                     precision: 6,  scale: 3,              comment: "??"
    t.decimal  "aw",                     precision: 6,  scale: 3,              comment: "??"
  end

  create_table "t_basket_team", comment: "???", primary_key: "team_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false, comment: "????"
    t.string "tr_name", limit: 50,              comment: "????"
    t.string "en_name", limit: 50,              comment: "????"
  end

  create_table "t_company", comment: "????", primary_key: "company_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false, comment: "????"
    t.string "en_name", limit: 50,              comment: "????"
  end

  create_table "t_continents", comment: "?", primary_key: "continents_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false, comment: "????"
    t.string  "en_name",    limit: 50,                            comment: "????"
    t.integer "sort_value", limit: 2,  precision: 2,              comment: "???"
  end

  create_table "t_country", comment: "??", primary_key: "country_id", force: :cascade do |t|
    t.string  "cn_name",       limit: 50,               null: false, comment: "????"
    t.string  "en_name",       limit: 50,                            comment: "????"
    t.integer "sort_value",    limit: 2,  precision: 2,              comment: "???"
    t.integer "continents_id", limit: 2,  precision: 2,              comment: "?ID"
  end

  create_table "t_event", comment: "????", id: false, force: :cascade do |t|
    t.integer "match_id",     limit: 14,  precision: 14, null: false, comment: "??ID"
    t.integer "type",         limit: 2,   precision: 2,  null: false, comment: "????(1???? 3????7????8????9????11???)"
    t.string  "player_name1", limit: 50,                              comment: "????1"
    t.string  "player_name2", limit: 50,                              comment: "????2"
    t.integer "happen_time",  limit: 3,   precision: 3,  null: false, comment: "????"
    t.boolean "ishome",       limit: nil,                null: false, comment: "?????1???0???"
  end

  create_table "t_league", comment: "??", primary_key: "league_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false, comment: "????"
    t.string  "tr_name",    limit: 50,                            comment: "????"
    t.string  "en_name",    limit: 50,                            comment: "????"
    t.integer "country_id", limit: 4,  precision: 4,              comment: "????ID"
  end

  create_table "t_league_rankings", comment: "??????", id: false, force: :cascade do |t|
    t.integer "team_id",  limit: 14,  precision: 14, null: false, comment: "??ID"
    t.boolean "type",     limit: nil,                null: false, comment: "???1???2???3???4???"
    t.integer "games",    limit: 3,   precision: 3,               comment: "?"
    t.integer "win",      limit: 3,   precision: 3,               comment: "?"
    t.integer "draw",     limit: 3,   precision: 3,               comment: "?"
    t.integer "lose",     limit: 3,   precision: 3,               comment: "?"
    t.integer "get",      limit: 3,   precision: 3,               comment: "?"
    t.integer "miss",     limit: 3,   precision: 3,               comment: "?"
    t.integer "pts",      limit: 3,   precision: 3,               comment: "??"
    t.integer "ranking",  limit: 3,   precision: 3,               comment: "??"
    t.integer "match_id", limit: 14,  precision: 14, null: false, comment: "??ID"
  end

  create_table "t_lineup", comment: "????", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 14,  precision: 14, null: false, comment: "??ID"
    t.integer "team_id",   limit: 14,  precision: 14, null: false, comment: "??ID"
    t.boolean "type",      limit: nil,                null: false, comment: "???1????2????3????4????"
    t.integer "shirt_num", limit: 3,   precision: 3,  null: false, comment: "????"
    t.string  "cn_name",   limit: 100,                null: false, comment: "??????"
    t.string  "tr_name",   limit: 100,                             comment: "??????"
    t.string  "en_name",   limit: 100,                             comment: "??????"
  end

  create_table "t_match", comment: "??", primary_key: "match_id", force: :cascade do |t|
    t.integer  "league_id",        limit: 14,  precision: 14, null: false, comment: "????ID"
    t.datetime "match_time",                                  null: false, comment: "????"
    t.integer  "team1_id",         limit: 14,  precision: 14, null: false, comment: "??ID"
    t.integer  "team2_id",         limit: 14,  precision: 14, null: false, comment: "??ID"
    t.integer  "home_score",       limit: 3,   precision: 3,  null: false, comment: "?????"
    t.integer  "guest_score",      limit: 3,   precision: 3,  null: false, comment: "?????"
    t.integer  "half_home_score",  limit: 3,   precision: 3,               comment: "???????"
    t.integer  "half_guest_score", limit: 3,   precision: 3,               comment: "???????"
    t.integer  "red_card",         limit: 2,   precision: 2,               comment: "???"
    t.integer  "yellow_card",      limit: 2,   precision: 2,               comment: "???"
    t.boolean  "match_level",      limit: nil,                             comment: "????"
    t.datetime "data_time",                                   null: false, comment: "??????"
  end

  create_table "t_odds_asian", comment: "????", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false, comment: "??ID"
    t.integer  "company_id", limit: 3,   precision: 3,            null: false, comment: "??ID"
    t.datetime "data_time",                                       null: false, comment: "????"
    t.boolean  "type",       limit: nil,                          null: false, comment: "?????1????2?????3????"
    t.decimal  "home",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "goal",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "away",                   precision: 6,  scale: 3,              comment: "??"
  end

  create_table "t_odds_ball", comment: "?????", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false, comment: "??ID"
    t.integer  "company_id", limit: 3,   precision: 3,            null: false, comment: "??ID"
    t.datetime "data_time",                                       null: false, comment: "????"
    t.boolean  "type",       limit: nil,                          null: false, comment: "?????1????2?????3????"
    t.decimal  "over",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "goal",                   precision: 6,  scale: 3,              comment: "??"
    t.decimal  "under",                  precision: 6,  scale: 3,              comment: "??"
  end

  create_table "t_odds_europe", comment: "????", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14,  precision: 14,           null: false, comment: "??ID"
    t.integer  "company_id", limit: 3,   precision: 3,            null: false, comment: "??ID"
    t.datetime "data_time",                                       null: false, comment: "????"
    t.boolean  "type",       limit: nil,                          null: false, comment: "?????1????2?????3????"
    t.decimal  "hw",                     precision: 6,  scale: 3,              comment: "??"
    t.decimal  "st",                     precision: 6,  scale: 3,              comment: "??"
    t.decimal  "aw",                     precision: 6,  scale: 3,              comment: "??"
  end

  create_table "t_team", comment: "??", primary_key: "team_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false, comment: "????"
    t.string "tr_name", limit: 50,              comment: "????"
    t.string "en_name", limit: 50,              comment: "????"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                             default: "",    null: false
    t.string   "encrypted_password",                                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      precision: 38, default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "company_name",           limit: 60,                                 null: false
    t.string   "address",                limit: 60
    t.string   "touch_man",              limit: 30
    t.string   "phone",                  limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               limit: nil,                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_users_reset_password_token", unique: true

  add_foreign_key "t_basket_league", "t_country", column: "country_id", primary_key: "country_id", name: "fk_t_basket_league_fk_t_c"
  add_foreign_key "t_basket_league_rankings", "t_basket_match", column: "match_id", primary_key: "match_id", name: "fk_t_basket_lr_fk_t_bm"
  add_foreign_key "t_basket_league_rankings", "t_basket_team", column: "team_id", primary_key: "team_id", name: "fk_t_basket_lr_fk_t_team"
  add_foreign_key "t_basket_match", "t_basket_league", column: "league_id", primary_key: "league_id", name: "fk_t_basket_match_fk_t_bl"
  add_foreign_key "t_basket_match", "t_basket_team", column: "team1_id", primary_key: "team_id", name: "fk_t_basket_match_fk_t_bt1"
  add_foreign_key "t_basket_match", "t_basket_team", column: "team2_id", primary_key: "team_id", name: "fk_t_basket_match_fk_t_bt2"
  add_foreign_key "t_basket_odds_asian", "t_basket_match", column: "match_id", primary_key: "match_id", name: "fk_t_basket_oa_fk_t_bm"
  add_foreign_key "t_basket_odds_asian", "t_company", column: "company_id", primary_key: "company_id", name: "fk_t_basket_oa_fk_t_company"
  add_foreign_key "t_basket_odds_ball", "t_basket_match", column: "match_id", primary_key: "match_id", name: "fk_t_basket_ob_fk_t_match"
  add_foreign_key "t_basket_odds_ball", "t_company", column: "company_id", primary_key: "company_id", name: "fk_t_basket_ob_fk_t_company"
  add_foreign_key "t_basket_odds_europe", "t_basket_match", column: "match_id", primary_key: "match_id", name: "fk_t_basket_oe_fk_t_bm"
  add_foreign_key "t_basket_odds_europe", "t_company", column: "company_id", primary_key: "company_id", name: "fk_t_basket_oe_fk_t_company"
  add_foreign_key "t_country", "t_continents", column: "continents_id", primary_key: "continents_id", name: "fk_t_country_fk_t_continents"
  add_foreign_key "t_league", "t_country", column: "country_id", primary_key: "country_id", name: "fk_t_league_fk_t_country"
  add_foreign_key "t_league_rankings", "t_match", column: "match_id", primary_key: "match_id", name: "fk_t_league_rankings_fk_t_m"
  add_foreign_key "t_league_rankings", "t_team", column: "team_id", primary_key: "team_id", name: "fk_t_league_rankings_fk_t_team"
  add_foreign_key "t_lineup", "t_team", column: "team_id", primary_key: "team_id", name: "fk_t_lineup_fk_t_team"
  add_foreign_key "t_match", "t_league", column: "league_id", primary_key: "league_id", name: "fk_t_match_fk_t_league"
  add_foreign_key "t_match", "t_match", column: "match_id", primary_key: "match_id", name: "fk_t_event_fk_t_league"
  add_foreign_key "t_match", "t_team", column: "team1_id", primary_key: "team_id", name: "fk_t_match_fk_t_team1"
  add_foreign_key "t_match", "t_team", column: "team2_id", primary_key: "team_id", name: "fk_t_match_fk_t_team2"
  add_foreign_key "t_odds_asian", "t_company", column: "company_id", primary_key: "company_id", name: "fk_t_odds_asian_fk_t_company"
  add_foreign_key "t_odds_asian", "t_match", column: "match_id", primary_key: "match_id", name: "fk_t_odds_asian_fk_t_match"
  add_foreign_key "t_odds_ball", "t_company", column: "company_id", primary_key: "company_id", name: "fk_t_odds_ball_fk_t_company"
  add_foreign_key "t_odds_ball", "t_match", column: "match_id", primary_key: "match_id", name: "fk_t_odds_ball_fk_t_match"
  add_foreign_key "t_odds_europe", "t_company", column: "company_id", primary_key: "company_id", name: "fk_t_odds_europe_fk_t_company"
  add_foreign_key "t_odds_europe", "t_match", column: "match_id", primary_key: "match_id", name: "fk_t_odds_europe_fk_t_match"
end
