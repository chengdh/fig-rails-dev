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

ActiveRecord::Schema.define(version: 20160217122407) do

  create_table "employees", force: :cascade do |t|
    t.integer  "org_id",              limit: 4,     null: false
    t.string   "name",                limit: 30,    null: false
    t.string   "gender",              limit: 1
    t.date     "birthday"
    t.string   "academic",            limit: 60
    t.string   "graduate_from",       limit: 60
    t.string   "id_no",               limit: 30
    t.string   "mobile",              limit: 20
    t.string   "address",             limit: 30
    t.string   "email",               limit: 30
    t.string   "qq",                  limit: 20
    t.string   "wechat",              limit: 30
    t.date     "work_day"
    t.string   "post",                limit: 30
    t.text     "note",                limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "employees", ["name"], name: "index_employees_on_name", using: :btree
  add_index "employees", ["org_id"], name: "index_employees_on_org_id", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.string   "name",                  limit: 30,                                          null: false
    t.integer  "equipment_category_id", limit: 4,                                           null: false
    t.integer  "unit_id",               limit: 4,                                           null: false
    t.decimal  "purchase_price",                    precision: 10, scale: 2
    t.datetime "purchase_date"
    t.string   "factory_name",          limit: 60
    t.string   "model",                 limit: 60
    t.integer  "guarantee_days",        limit: 4,                            default: 180
    t.integer  "order_by",              limit: 4,                            default: 1
    t.boolean  "is_active",             limit: 1,                            default: true
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.string   "photo_file_name",       limit: 255
    t.string   "photo_content_type",    limit: 255
    t.integer  "photo_file_size",       limit: 4
    t.datetime "photo_updated_at"
  end

  add_index "equipment", ["equipment_category_id"], name: "index_equipment_on_equipment_category_id", using: :btree
  add_index "equipment", ["unit_id"], name: "index_equipment_on_unit_id", using: :btree

  create_table "equipment_categories", force: :cascade do |t|
    t.string   "name",       limit: 60,                null: false
    t.integer  "order_by",   limit: 4,  default: 1
    t.boolean  "is_active",  limit: 1,  default: true
    t.integer  "org_id",     limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "equipment_categories", ["name"], name: "index_equipment_categories_on_name", using: :btree
  add_index "equipment_categories", ["org_id"], name: "index_equipment_categories_on_org_id", using: :btree

  create_table "inout_bills", force: :cascade do |t|
    t.integer  "org_id",        limit: 4
    t.date     "bill_date",                   null: false
    t.integer  "user_id",       limit: 4
    t.integer  "f_location_id", limit: 4,     null: false
    t.integer  "t_location_id", limit: 4,     null: false
    t.string   "operater",      limit: 30
    t.string   "state",         limit: 60
    t.string   "type",          limit: 60
    t.text     "note",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "inout_bills", ["user_id"], name: "index_inout_bills_on_user_id", using: :btree

  create_table "inout_lines", force: :cascade do |t|
    t.integer  "equipment_id",  limit: 4,                                       null: false
    t.integer  "inout_bill_id", limit: 4,                                       null: false
    t.integer  "f_location_id", limit: 4,                                       null: false
    t.integer  "t_location_id", limit: 4,                                       null: false
    t.date     "move_date"
    t.string   "state",         limit: 60
    t.integer  "qty",           limit: 4,                           default: 1
    t.decimal  "price",                    precision: 15, scale: 2
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "inout_lines", ["inout_bill_id"], name: "index_inout_lines_on_inout_bill_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",         limit: 30,                   null: false
    t.integer  "warehouse_id", limit: 4
    t.string   "x",            limit: 20,    default: "0"
    t.string   "y",            limit: 20,    default: "0"
    t.string   "z",            limit: 20,    default: "0"
    t.integer  "order_by",     limit: 4,     default: 1
    t.boolean  "is_active",    limit: 1,     default: true
    t.text     "note",         limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "locations", ["warehouse_id"], name: "index_locations_on_warehouse_id", using: :btree

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

  create_table "units", force: :cascade do |t|
    t.string   "name",       limit: 30,                null: false
    t.integer  "order_by",   limit: 4,  default: 1
    t.boolean  "is_active",  limit: 1,  default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

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

  create_table "v_stock", id: false, force: :cascade do |t|
    t.integer "location_id",  limit: 4,                            null: false
    t.integer "equipment_id", limit: 4,                            null: false
    t.decimal "qty",                    precision: 33, default: 0, null: false
  end

  create_table "v_stock_in", id: false, force: :cascade do |t|
    t.integer "t_location_id", limit: 4,                          null: false
    t.integer "equipment_id",  limit: 4,                          null: false
    t.decimal "qty",                     precision: 32
    t.decimal "amt",                     precision: 47, scale: 2
  end

  create_table "v_stock_out", id: false, force: :cascade do |t|
    t.integer "f_location_id", limit: 4,                          null: false
    t.integer "equipment_id",  limit: 4,                          null: false
    t.decimal "qty",                     precision: 32
    t.decimal "amt",                     precision: 47, scale: 2
  end

  create_table "warehouse_types", force: :cascade do |t|
    t.string   "name",       limit: 30,                null: false
    t.integer  "order_by",   limit: 4,  default: 1
    t.boolean  "is_active",  limit: 1,  default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name",                limit: 30,                                            null: false
    t.integer  "org_id",              limit: 4,                                             null: false
    t.integer  "warehouse_type_id",   limit: 4
    t.integer  "default_location_id", limit: 4
    t.string   "address",             limit: 60
    t.string   "leader",              limit: 30
    t.integer  "order_by",            limit: 4,                              default: 1
    t.boolean  "is_active",           limit: 1,                              default: true
    t.string   "phone",               limit: 30
    t.decimal  "area",                              precision: 15, scale: 2
    t.decimal  "volume",                            precision: 15, scale: 2
    t.text     "note",                limit: 65535
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
  end

  add_index "warehouses", ["org_id"], name: "index_warehouses_on_org_id", using: :btree
  add_index "warehouses", ["warehouse_type_id"], name: "index_warehouses_on_warehouse_type_id", using: :btree

  add_foreign_key "employees", "orgs"
  add_foreign_key "equipment_categories", "orgs"
  add_foreign_key "role_system_function_operates", "roles"
  add_foreign_key "role_system_function_operates", "system_function_operates"
  add_foreign_key "system_function_operates", "system_functions"
  add_foreign_key "system_functions", "system_function_groups"
  add_foreign_key "user_orgs", "orgs"
  add_foreign_key "user_orgs", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
