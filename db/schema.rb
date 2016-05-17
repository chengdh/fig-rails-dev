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

ActiveRecord::Schema.define(version: 20160517124021) do

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

  create_table "t_basket_current_match", comment: "篮球即时比赛信息", primary_key: "match_id", force: :cascade do |t|
    t.integer  "match_status", limit: 2,  precision: 2, null: false, comment: "当前比赛状态（0、未开赛；1、第一节；2、第二节；3、第三节；4、第四节；>=5、加时；50、中场休息；-1、比赛结束）"
    t.string   "match_time",   limit: 10,                            comment: "计时（格式：mm:ss）"
    t.integer  "home_score",   limit: 3,  precision: 3, null: false, comment: "当前主队分数"
    t.integer  "guest_score",  limit: 3,  precision: 3, null: false, comment: "当前客队分数"
    t.integer  "home_score1",  limit: 3,  precision: 3,              comment: "当前第一节主队分数"
    t.integer  "guest_score1", limit: 3,  precision: 3,              comment: "当前第一节客队分数"
    t.integer  "home_score2",  limit: 3,  precision: 3,              comment: "当前第二节主队分数"
    t.integer  "guest_score2", limit: 3,  precision: 3,              comment: "当前第二节客队分数"
    t.integer  "home_score3",  limit: 3,  precision: 3,              comment: "当前第三节主队分数"
    t.integer  "guest_score3", limit: 3,  precision: 3,              comment: "当前第三节客队分数"
    t.integer  "home_score4",  limit: 3,  precision: 3,              comment: "当前第四节主队分数"
    t.integer  "guest_score4", limit: 3,  precision: 3,              comment: "当前第四节客队分数"
    t.datetime "data_time",                             null: false, comment: "数据更新时间"
    t.integer  "home_score5",  limit: 3,  precision: 3,              comment: "加时主队分数"
    t.integer  "guest_score5", limit: 3,  precision: 3,              comment: "加时客队分数"
  end

  create_table "t_basket_league", comment: "篮球联赛", primary_key: "league_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false, comment: "中文名称"
    t.string  "tr_name",    limit: 50,                            comment: "繁体名称"
    t.string  "en_name",    limit: 50,                            comment: "英文名称"
    t.integer "country_id", limit: 4,  precision: 4,              comment: "所属国家ID"
  end

  create_table "t_basket_league_rankings", comment: "篮球联赛积分排名", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 14, precision: 14,           null: false, comment: "比赛ID"
    t.integer "team_id",   limit: 14, precision: 14,           null: false, comment: "篮球队ID"
    t.integer "odds_type", limit: 1,  precision: 1,            null: false, comment: "类型（1、总；2、主；3、客；4、近）"
    t.integer "games",     limit: 3,  precision: 3,                         comment: "赛"
    t.integer "win",       limit: 3,  precision: 3,                         comment: "胜"
    t.integer "lose",      limit: 3,  precision: 3,                         comment: "负"
    t.decimal "get",                  precision: 4,  scale: 1,              comment: "得"
    t.decimal "miss",                 precision: 4,  scale: 1,              comment: "失"
    t.integer "ranking",   limit: 3,  precision: 3,                         comment: "排名"
  end

  create_table "t_basket_match", comment: "篮球比赛", primary_key: "match_id", force: :cascade do |t|
    t.integer  "league_id",    limit: 14, precision: 14, null: false, comment: "所属联赛ID"
    t.datetime "match_time",                             null: false, comment: "比赛时间"
    t.integer  "team1_id",     limit: 14, precision: 14, null: false, comment: "主队ID"
    t.integer  "team2_id",     limit: 14, precision: 14, null: false, comment: "客队ID"
    t.integer  "home_score",   limit: 3,  precision: 3,               comment: "主队分数"
    t.integer  "guest_score",  limit: 3,  precision: 3,               comment: "客队分数"
    t.integer  "home_score1",  limit: 3,  precision: 3,               comment: "第一节主队分数"
    t.integer  "guest_score1", limit: 3,  precision: 3,               comment: "第一节客队分数"
    t.integer  "home_score2",  limit: 3,  precision: 3,               comment: "第二节主队分数"
    t.integer  "guest_score2", limit: 3,  precision: 3,               comment: "第二节客队分数"
    t.integer  "home_score3",  limit: 3,  precision: 3,               comment: "第三节主队分数"
    t.integer  "guest_score3", limit: 3,  precision: 3,               comment: "第三节客队分数"
    t.integer  "home_score4",  limit: 3,  precision: 3,               comment: "第四节主队分数"
    t.integer  "guest_score4", limit: 3,  precision: 3,               comment: "第四节客队分数"
    t.datetime "data_time",                              null: false, comment: "数据更新时间"
    t.integer  "home_score5",  limit: 3,  precision: 3,               comment: "加时主队分数"
    t.integer  "guest_score5", limit: 3,  precision: 3,               comment: "加时客队分数"
  end

  create_table "t_basket_odds_asian", comment: "亚盘数据", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14, precision: 14,           null: false, comment: "比赛ID"
    t.integer  "company_id", limit: 3,  precision: 3,            null: false, comment: "公司ID"
    t.datetime "data_time",                                      null: false, comment: "数据时间"
    t.integer  "odds_type",  limit: 1,  precision: 1,            null: false, comment: "数据类型（1、初盘；2、即时盘；3、终盘）"
    t.decimal  "home",                  precision: 6,  scale: 3,              comment: "主队"
    t.decimal  "goal",                  precision: 6,  scale: 3,              comment: "让球"
    t.decimal  "away",                  precision: 6,  scale: 3,              comment: "客队"
  end

  create_table "t_basket_odds_ball", comment: "篮球大小球数据", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14, precision: 14,           null: false, comment: "比赛ID"
    t.integer  "company_id", limit: 3,  precision: 3,            null: false, comment: "公司ID"
    t.datetime "data_time",                                      null: false, comment: "数据时间"
    t.integer  "odds_type",  limit: 1,  precision: 1,            null: false, comment: "数据类型（1、初盘；2、即时盘；3、终盘）"
    t.decimal  "over",                  precision: 7,  scale: 3,              comment: "大球"
    t.decimal  "goal",                  precision: 7,  scale: 3,              comment: "盘口"
    t.decimal  "under",                 precision: 7,  scale: 3,              comment: "小球"
  end

  create_table "t_basket_odds_europe", comment: "篮球欧盘数据", id: false, force: :cascade do |t|
    t.integer  "match_id",   limit: 14, precision: 14,           null: false, comment: "比赛ID"
    t.integer  "company_id", limit: 3,  precision: 3,            null: false, comment: "公司ID"
    t.datetime "data_time",                                      null: false, comment: "数据时间"
    t.integer  "odds_type",  limit: 1,  precision: 1,            null: false, comment: "数据类型（1、初盘；2、即时盘；3、终盘）"
    t.decimal  "hw",                    precision: 7,  scale: 3,              comment: "主胜"
    t.decimal  "aw",                    precision: 7,  scale: 3,              comment: "客胜"
  end

  create_table "t_basket_team", comment: "篮球队", primary_key: "team_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false, comment: "中文名称"
    t.string "tr_name", limit: 50,              comment: "繁体名称"
    t.string "en_name", limit: 50,              comment: "英文名称"
  end

  create_table "t_comment", comment: "评论", primary_key: "comment_id", force: :cascade do |t|
    t.integer  "match_id",  limit: 14,   precision: 14, null: false, comment: "比赛ID"
    t.integer  "user_id",   limit: 14,   precision: 14, null: false, comment: "用户ID"
    t.datetime "data_time",                             null: false, comment: "评论时间"
    t.integer  "parent_id", limit: 14,   precision: 14,              comment: "父评论ID"
    t.string   "content",   limit: 4000,                             comment: "评论内容"
  end

  create_table "t_company", comment: "博彩公司", primary_key: "company_id", force: :cascade do |t|
    t.string "cn_name", limit: 50, null: false, comment: "中文名称"
    t.string "en_name", limit: 50,              comment: "英文名称"
  end

  create_table "t_continents", comment: "洲", primary_key: "continents_id", force: :cascade do |t|
    t.string  "cn_name",    limit: 50,               null: false, comment: "中文名称"
    t.string  "en_name",    limit: 50,                            comment: "英文名称"
    t.integer "sort_value", limit: 2,  precision: 2,              comment: "排序值"
  end

  create_table "t_country", comment: "国家", primary_key: "country_id", force: :cascade do |t|
    t.string  "cn_name",       limit: 50,               null: false, comment: "中文名称"
    t.string  "en_name",       limit: 50,                            comment: "英文名称"
    t.integer "sort_value",    limit: 2,  precision: 2,              comment: "排序值"
    t.integer "continents_id", limit: 2,  precision: 2,              comment: "洲ID"
  end

  create_table "t_cup_ranking", comment: "杯赛积分", id: false, force: :cascade do |t|
    t.integer "team_id",   limit: 14, precision: 14, null: false, comment: "球队ID"
    t.integer "stage_id",  limit: 14, precision: 14, null: false, comment: "阶段ID"
    t.string  "group_no",  limit: 2,                 null: false, comment: "小组号"
    t.integer "ranking",   limit: 2,  precision: 2,  null: false, comment: "排名"
    t.integer "games",     limit: 3,  precision: 3,               comment: "赛"
    t.integer "win",       limit: 3,  precision: 3,               comment: "胜"
    t.integer "draw",      limit: 3,  precision: 3,               comment: "平"
    t.integer "lose",      limit: 3,  precision: 3,               comment: "负"
    t.integer "get",       limit: 3,  precision: 3,               comment: "得"
    t.integer "miss",      limit: 3,  precision: 3,               comment: "失"
    t.integer "pts",       limit: 3,  precision: 3,               comment: "积分"
    t.integer "season_id", limit: 14, precision: 14, null: false, comment: "赛季ID"
  end

  create_table "t_cup_schedule", comment: "赛程", id: false, force: :cascade do |t|
    t.integer "season_id", limit: 14, precision: 14, null: false, comment: "赛季ID"
    t.integer "match_id",  limit: 14, precision: 14, null: false, comment: "比赛ID"
    t.integer "stage_id",  limit: 14, precision: 14, null: false, comment: "阶段ID"
    t.string  "group_no",  limit: 2,                              comment: "小组号"
  end

  create_table "t_current_match", comment: "即时比赛信息", primary_key: "match_id", force: :cascade do |t|
    t.integer  "match_status",      limit: 2, precision: 2, null: false, comment: "当前比赛状态（0、未开赛；1、上半场；2、半场休息；3、下半场；4、加时赛；-1、比赛结束；-10、取消；-11、待定；-14、推迟；）"
    t.datetime "first_time",                                             comment: "上半场开始时间"
    t.datetime "second_time",                                            comment: "下半场开始时间"
    t.integer  "home_score",        limit: 3, precision: 3, null: false, comment: "当前主队进球数"
    t.integer  "guest_score",       limit: 3, precision: 3, null: false, comment: "当前客队进球数"
    t.integer  "home_red_card",     limit: 2, precision: 2,              comment: "当前主队红牌数"
    t.integer  "guest_red_card",    limit: 2, precision: 2,              comment: "当前客队红牌数"
    t.integer  "home_yellow_card",  limit: 2, precision: 2,              comment: "当前主队黄牌数"
    t.integer  "guest_yellow_card", limit: 2, precision: 2,              comment: "当前客队黄牌数"
    t.datetime "data_time",                                 null: false, comment: "数据更新时间"
  end

  create_table "t_event", comment: "比赛事件", id: false, force: :cascade do |t|
    t.integer  "match_id",     limit: 14,  precision: 14, null: false, comment: "比赛ID"
    t.integer  "event_type",   limit: 2,   precision: 2,  null: false, comment: "事件类型（1、进球； 3、黄牌；7、点球；8、乌龙；9、红牌；11、换人）"
    t.string   "player_name1", limit: 100,                             comment: "球员名称1"
    t.string   "player_name2", limit: 100,                             comment: "球员名称2"
    t.integer  "happen_time",  limit: 3,   precision: 3,  null: false, comment: "发生时间"
    t.integer  "ishome",       limit: 1,   precision: 1,  null: false, comment: "是否主队（1、是；0、否）"
    t.datetime "data_time",                               null: false
  end

  create_table "t_league", comment: "联赛", primary_key: "league_id", force: :cascade do |t|
    t.string  "cn_name",     limit: 50,               null: false, comment: "中文名称"
    t.string  "tr_name",     limit: 50,                            comment: "繁体名称"
    t.string  "en_name",     limit: 50,                            comment: "英文名称"
    t.integer "country_id",  limit: 4,  precision: 4,              comment: "所属国家ID"
    t.integer "league_type", limit: 1,  precision: 1,              comment: "联赛类型（1、联赛；2、杯赛）"
    t.integer "sort_value",  limit: 4,  precision: 4,              comment: "排序值"
  end

  create_table "t_league_rankings", comment: "联赛积分排名", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 14, precision: 14, null: false, comment: "比赛ID"
    t.integer "team_id",   limit: 14, precision: 14, null: false, comment: "球队ID"
    t.integer "odds_type", limit: 1,  precision: 1,  null: false, comment: "类型（1、总；2、主；3、客；4、近）"
    t.integer "games",     limit: 3,  precision: 3,               comment: "赛"
    t.integer "win",       limit: 3,  precision: 3,               comment: "胜"
    t.integer "draw",      limit: 3,  precision: 3,               comment: "平"
    t.integer "lose",      limit: 3,  precision: 3,               comment: "负"
    t.integer "get",       limit: 3,  precision: 3,               comment: "得"
    t.integer "miss",      limit: 3,  precision: 3,               comment: "失"
    t.integer "pts",       limit: 3,  precision: 3,               comment: "积分"
    t.integer "ranking",   limit: 3,  precision: 3,               comment: "排名"
  end

  create_table "t_lineup", comment: "球队阵容", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 14,  precision: 14, null: false, comment: "比赛ID"
    t.integer "team_id",   limit: 14,  precision: 14, null: false, comment: "球队ID"
    t.integer "odds_type", limit: 1,   precision: 1,  null: false, comment: "类型（1、首发；2、替补；3、伤兵；4、停赛）"
    t.integer "shirt_num", limit: 3,   precision: 3,  null: false, comment: "球衣号码"
    t.string  "cn_name",   limit: 100,                null: false, comment: "球员中文名称"
    t.string  "tr_name",   limit: 100,                             comment: "球员繁体名称"
    t.string  "en_name",   limit: 100,                             comment: "球员英文名称"
  end

  create_table "t_match", comment: "比赛", primary_key: "match_id", force: :cascade do |t|
    t.integer  "league_id",         limit: 14, precision: 14,                       null: false, comment: "所属联赛ID"
    t.datetime "match_time",                                                        null: false, comment: "比赛时间"
    t.integer  "team1_id",          limit: 14, precision: 14,                       null: false, comment: "主队ID"
    t.integer  "team2_id",          limit: 14, precision: 14,                       null: false, comment: "客队ID"
    t.integer  "home_score",        limit: 3,  precision: 3,                                     comment: "主队进球数"
    t.integer  "guest_score",       limit: 3,  precision: 3,                                     comment: "客队进球数"
    t.integer  "half_home_score",   limit: 3,  precision: 3,                                     comment: "半场主队进球数"
    t.integer  "half_guest_score",  limit: 3,  precision: 3,                                     comment: "半场客队进球数"
    t.integer  "match_level",       limit: 1,  precision: 1,                                     comment: "比赛等级"
    t.datetime "data_time",                                                         null: false, comment: "数据更新时间"
    t.integer  "home_red_card",     limit: 2,  precision: 2,            default: 0, null: false, comment: "主队红牌数"
    t.integer  "guest_red_card",    limit: 2,  precision: 2,            default: 0, null: false, comment: "客队红牌数"
    t.integer  "home_yellow_card",  limit: 2,  precision: 2,            default: 0, null: false, comment: "主队黄牌数"
    t.integer  "guest_yellow_card", limit: 2,  precision: 2,            default: 0, null: false, comment: "客队黄牌数"
    t.decimal  "odds_value",                   precision: 7,  scale: 3,                          comment: "盘路值"
    t.integer  "odds_result",       limit: 1,  precision: 1,                                     comment: "盘路结果（1、赢；0、输；2、走）"
    t.datetime "usa_match_time",                                                                 comment: "美国比赛时间"
    t.integer  "odds_type",         limit: 1,  precision: 1,                                     comment: "比赛结果盘口统计（1、上盘；2、下盘；3、走盘）"
  end

  create_table "t_match_recommend", comment: "比赛推荐", id: false, force: :cascade do |t|
    t.integer  "match_id",       limit: 14, precision: 14,           null: false, comment: "比赛ID"
    t.integer  "team_id",        limit: 14, precision: 14,                        comment: "队伍ID"
    t.integer  "recommend_type", limit: 1,  precision: 1,            null: false, comment: "推荐类型（1、大数据推荐；2、盈朗推荐）"
    t.datetime "data_time",                                          null: false, comment: "推荐时间"
    t.integer  "result_type",    limit: 1,  precision: 1,                         comment: "推荐结果（2、全赢；1、半赢；0、走；-1、半输；-2、全输）"
    t.integer  "win_money",      limit: 5,  precision: 5,                         comment: "钱"
    t.decimal  "home",                      precision: 6,  scale: 3,              comment: "主队"
    t.decimal  "goal",                      precision: 6,  scale: 3,              comment: "让球"
    t.decimal  "away",                      precision: 6,  scale: 3,              comment: "客队"
  end

  create_table "t_match_recommend_temp", comment: "比赛推荐", id: false, force: :cascade do |t|
    t.integer  "match_id",       limit: 14, precision: 14,           null: false, comment: "比赛ID"
    t.integer  "team_id",        limit: 14, precision: 14,           null: false, comment: "队伍ID"
    t.integer  "recommend_type", limit: 1,  precision: 1,            null: false, comment: "推荐类型（1、大数据推荐；2、盈朗推荐）"
    t.datetime "data_time",                                          null: false, comment: "推荐时间"
    t.decimal  "home",                      precision: 6,  scale: 3,              comment: "主队"
    t.decimal  "goal",                      precision: 6,  scale: 3,              comment: "让球"
    t.decimal  "away",                      precision: 6,  scale: 3,              comment: "客队"
  end

