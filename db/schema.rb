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

ActiveRecord::Schema.define(version: 20170219080239) do

  create_table "cux_demand_platform_headers_a", force: :cascade do |t|
    t.string   "apply_number",        limit: 30
    t.string   "ou_name",             limit: 60
    t.integer  "org_id",              limit: 4
    t.datetime "apply_date"
    t.string   "apply_source",        limit: 30
    t.string   "apply_deparment",     limit: 30
    t.string   "applier_user",        limit: 30
    t.string   "apply_type",          limit: 30
    t.text     "remark",              limit: 65535
    t.string   "project_number",      limit: 30
    t.string   "project_name",        limit: 300
    t.string   "task_name",           limit: 300
    t.string   "task_number",         limit: 30
    t.string   "urge_flag",           limit: 30
    t.string   "attribute1",          limit: 30
    t.integer  "wip_entity_id",       limit: 4
    t.string   "wip_entity_name",     limit: 30
    t.decimal  "bugdet_total",                      precision: 15, scale: 2, default: 0.0
    t.decimal  "bugdet_demand_total",               precision: 15, scale: 2, default: 0.0
    t.decimal  "header_bugdet",                     precision: 15, scale: 2, default: 0.0
    t.decimal  "bugdet_balance",                    precision: 15, scale: 2, default: 0.0
    t.decimal  "actual_cost",                       precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.string   "wf_itemkey",          limit: 60
  end

  create_table "cux_demand_platform_lines_a", force: :cascade do |t|
    t.integer  "cux_demand_id",    limit: 4
    t.string   "line_type",        limit: 30
    t.string   "apply_number",     limit: 30
    t.string   "item_number",      limit: 30
    t.integer  "item_id",          limit: 4
    t.string   "item_description", limit: 60
    t.string   "item_spec",        limit: 60
    t.decimal  "item_price",                  precision: 15, scale: 2, default: 0.0
    t.decimal  "demand_quantiry",             precision: 15, scale: 2, default: 0.0
    t.decimal  "line_budget",                 precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "name",       limit: 60,                   null: false
    t.integer  "parent_id",  limit: 4
    t.string   "address",    limit: 60
    t.string   "org_type",   limit: 10
    t.boolean  "is_active",  limit: 1,     default: true
    t.integer  "order_by",   limit: 4,     default: 1
    t.text     "note",       limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "manager",    limit: 30
    t.string   "phone",      limit: 30
    t.string   "email",      limit: 30
  end

  create_table "role_system_function_operates", force: :cascade do |t|
    t.integer  "role_id",                    limit: 4
    t.integer  "system_function_operate_id", limit: 4
    t.boolean  "is_select",                  limit: 1, default: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "role_system_function_operates", ["role_id"], name: "index_role_system_function_operates_on_role_id", using: :btree
  add_index "role_system_function_operates", ["system_function_operate_id"], name: "fk_rails_fad876bc59", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 60,                null: false
    t.boolean  "is_active",  limit: 1,  default: true
    t.integer  "order_by",   limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "system_function_groups", force: :cascade do |t|
    t.string   "name",       limit: 60,                   null: false
    t.boolean  "is_active",  limit: 1,     default: true
    t.integer  "order_by",   limit: 4
    t.text     "note",       limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "system_function_operates", force: :cascade do |t|
    t.string   "name",               limit: 60,                   null: false
    t.integer  "system_function_id", limit: 4
    t.text     "function_obj",       limit: 65535
    t.boolean  "is_active",          limit: 1,     default: true
    t.integer  "order_by",           limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "system_function_operates", ["system_function_id"], name: "index_system_function_operates_on_system_function_id", using: :btree

  create_table "system_functions", force: :cascade do |t|
    t.string   "name",                     limit: 60,                   null: false
    t.boolean  "is_active",                limit: 1,     default: true
    t.integer  "order_by",                 limit: 4
    t.integer  "system_function_group_id", limit: 4
    t.text     "default_action",           limit: 65535
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "system_functions", ["system_function_group_id"], name: "index_system_functions_on_system_function_group_id", using: :btree

  create_table "user_orgs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "org_id",     limit: 4
    t.boolean  "is_select",  limit: 1, default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_orgs", ["org_id"], name: "index_user_orgs_on_org_id", using: :btree
  add_index "user_orgs", ["user_id"], name: "index_user_orgs_on_user_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.boolean  "is_select",  limit: 1, default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "address",                limit: 60
    t.string   "touch_man",              limit: 30
    t.string   "phone",                  limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               limit: 1,   default: false
    t.string   "username",               limit: 30,                  null: false
    t.integer  "default_org_id",         limit: 4
    t.integer  "default_role_id",        limit: 4
    t.string   "real_name",              limit: 255
    t.boolean  "is_active",              limit: 1,   default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "wf_notifications_a", force: :cascade do |t|
    t.string   "message_type", limit: 30
    t.string   "status",       limit: 20
    t.string   "from_user",    limit: 40
    t.string   "to_user",      limit: 40
    t.text     "subject",      limit: 65535
    t.string   "item_key",     limit: 40
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.date     "begin_date"
    t.integer  "fuser_id",     limit: 4
  end

  add_foreign_key "role_system_function_operates", "roles"
  add_foreign_key "role_system_function_operates", "system_function_operates"
  add_foreign_key "system_function_operates", "system_functions"
  add_foreign_key "system_functions", "system_function_groups"
  add_foreign_key "user_orgs", "orgs"
  add_foreign_key "user_orgs", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
