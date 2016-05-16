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

ActiveRecord::Schema.define(version: 20160515134940) do

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

