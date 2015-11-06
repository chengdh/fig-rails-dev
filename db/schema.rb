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

ActiveRecord::Schema.define(version: 20151106071041) do

  create_table "register_infos", force: :cascade do |t|
    t.string   "company_name",                limit: 60,                                           null: false
    t.string   "legal_code",                  limit: 60,                                           null: false
    t.string   "address",                     limit: 60
    t.string   "legaler",                     limit: 60
    t.string   "union_company_name",          limit: 60
    t.integer  "logistics_level",             limit: 4
    t.string   "project_manager",             limit: 60
    t.string   "pm_phone",                    limit: 20
    t.string   "pm_fax",                      limit: 20
    t.string   "pm_mobile",                   limit: 20
    t.decimal  "capital",                                   precision: 15, scale: 2, default: 0.0
    t.date     "register_date"
    t.integer  "ec_typee",                    limit: 4
    t.decimal  "income_2012",                               precision: 15, scale: 2, default: 0.0
    t.decimal  "profit_2012",                               precision: 15, scale: 2, default: 0.0
    t.integer  "employees_count_2012",        limit: 4,                              default: 0
    t.decimal  "asset_2012",                                precision: 15, scale: 2, default: 0.0
    t.decimal  "pure_asset_2012",                           precision: 15, scale: 2, default: 0.0
    t.decimal  "tax_2011",                                  precision: 15, scale: 2, default: 0.0
    t.decimal  "tax_2012",                                  precision: 15, scale: 2, default: 0.0
    t.decimal  "profit_pure_asset_2012",                    precision: 15, scale: 2, default: 0.0
    t.decimal  "profit_flow_asset_2012",                    precision: 15, scale: 2, default: 0.0
    t.decimal  "rate_balance_2012",                         precision: 15, scale: 2, default: 0.0
    t.string   "project_name",                limit: 60
    t.text     "project_context",             limit: 65535
    t.text     "project_kpi",                 limit: 65535
    t.string   "project_belongs",             limit: 255
    t.date     "project_begin_date"
    t.date     "project_end_date"
    t.decimal  "project_sum_invest",                        precision: 15, scale: 2, default: 0.0
    t.decimal  "project_sum_invest_self",                   precision: 15, scale: 2, default: 0.0
    t.decimal  "project_sum_invest_loan",                   precision: 15, scale: 2, default: 0.0
    t.decimal  "project_sum_apply",                         precision: 15, scale: 2, default: 0.0
    t.integer  "project_apply_type",          limit: 4
    t.decimal  "project_already_invest_2012",               precision: 15, scale: 2, default: 0.0
    t.decimal  "project_already_invest_2013",               precision: 15, scale: 2, default: 0.0
    t.integer  "is_important",                limit: 4,                              default: 0
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.string   "attach_1_file_name",          limit: 255
    t.string   "attach_1_content_type",       limit: 255
    t.integer  "attach_1_file_size",          limit: 4
    t.datetime "attach_1_updated_at"
    t.string   "attach_2_file_name",          limit: 255
    t.string   "attach_2_content_type",       limit: 255
    t.integer  "attach_2_file_size",          limit: 4
    t.datetime "attach_2_updated_at"
    t.string   "attach_3_file_name",          limit: 255
    t.string   "attach_3_content_type",       limit: 255
    t.integer  "attach_3_file_size",          limit: 4
    t.datetime "attach_3_updated_at"
    t.string   "attach_4_file_name",          limit: 255
    t.string   "attach_4_content_type",       limit: 255
    t.integer  "attach_4_file_size",          limit: 4
    t.datetime "attach_4_updated_at"
    t.string   "attach_5_file_name",          limit: 255
    t.string   "attach_5_content_type",       limit: 255
    t.integer  "attach_5_file_size",          limit: 4
    t.datetime "attach_5_updated_at"
    t.string   "attach_6_file_name",          limit: 255
    t.string   "attach_6_content_type",       limit: 255
    t.integer  "attach_6_file_size",          limit: 4
    t.datetime "attach_6_updated_at"
    t.string   "attach_7_file_name",          limit: 255
    t.string   "attach_7_content_type",       limit: 255
    t.integer  "attach_7_file_size",          limit: 4
    t.datetime "attach_7_updated_at"
    t.string   "attach_8_file_name",          limit: 255
    t.string   "attach_8_content_type",       limit: 255
    t.integer  "attach_8_file_size",          limit: 4
    t.datetime "attach_8_updated_at"
    t.string   "attach_9_file_name",          limit: 255
    t.string   "attach_9_content_type",       limit: 255
    t.integer  "attach_9_file_size",          limit: 4
    t.datetime "attach_9_updated_at"
    t.string   "attach_10_file_name",         limit: 255
    t.string   "attach_10_content_type",      limit: 255
    t.integer  "attach_10_file_size",         limit: 4
    t.datetime "attach_10_updated_at"
    t.integer  "user_id",                     limit: 4
  end

  create_table "user_web_apps", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                 null: false
    t.integer  "web_app_id", limit: 4
    t.string   "username",   limit: 30
    t.string   "password",   limit: 30
    t.boolean  "is_active",  limit: 1,  default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_web_apps", ["user_id"], name: "index_user_web_apps_on_user_id", using: :btree
  add_index "user_web_apps", ["web_app_id"], name: "index_user_web_apps_on_web_app_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: ""
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "company_name",           limit: 255
    t.string   "address",                limit: 255
    t.string   "touch_man",              limit: 255
    t.string   "phone",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               limit: 1,   default: false
    t.string   "username",               limit: 30,                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "web_apps", force: :cascade do |t|
    t.string   "name",             limit: 60,                     null: false
    t.string   "form_el_username", limit: 60,                     null: false
    t.string   "form_el_password", limit: 60,                     null: false
    t.string   "form_method",      limit: 30,    default: "post", null: false
    t.string   "form_action",      limit: 200,                    null: false
    t.boolean  "is_active",        limit: 1
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.text     "form_url",         limit: 65535
  end

  add_foreign_key "user_web_apps", "users"
  add_foreign_key "user_web_apps", "web_apps"
end
