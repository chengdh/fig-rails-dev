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

ActiveRecord::Schema.define(version: 20160503014346) do

  create_table "accident_headers", force: :cascade do |t|
    t.integer  "org_id",        limit: 4,                       null: false
    t.string   "mth",           limit: 6,                       null: false
    t.date     "table_date"
    t.integer  "user_id",       limit: 4
    t.text     "note",          limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "submitter_id",  limit: 4
    t.date     "submit_date"
    t.text     "submit_note",   limit: 65535
    t.string   "check_state",   limit: 30,    default: "draft"
    t.integer  "checker_id",    limit: 4
    t.text     "check_opinion", limit: 65535
    t.date     "check_date"
  end

  add_index "accident_headers", ["org_id"], name: "index_accident_headers_on_org_id", using: :btree
  add_index "accident_headers", ["user_id"], name: "index_accident_headers_on_user_id", using: :btree

  create_table "accident_types", force: :cascade do |t|
    t.string   "name",           limit: 60,                 null: false
    t.integer  "order_by",       limit: 4,  default: 1
    t.boolean  "is_active",      limit: 1,  default: true
    t.boolean  "is_work_injury", limit: 1,  default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "accidents", force: :cascade do |t|
    t.integer  "accident_header_id",         limit: 4,                                null: false
    t.integer  "accident_type_id",           limit: 4,                                null: false
    t.integer  "industry_accident_count",    limit: 4,                    default: 0
    t.integer  "industry_die_persons",       limit: 4,                    default: 0
    t.integer  "industry_wounded_persons",   limit: 4,                    default: 0
    t.decimal  "industry_economic_losses",                 precision: 10, default: 0
    t.text     "industry_note",              limit: 65535
    t.integer  "commerical_accident_count",  limit: 4,                    default: 0
    t.integer  "commerical_die_persons",     limit: 4,                    default: 0
    t.integer  "commerical_wounded_persons", limit: 4,                    default: 0
    t.decimal  "commerical_economic_losses",               precision: 10, default: 0
    t.text     "commerical_note",            limit: 65535
    t.text     "note",                       limit: 65535
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.integer  "org_id",                    limit: 4
    t.date     "table_date",                                                                         null: false
    t.string   "mth",                       limit: 20,                                               null: false
    t.string   "check_state",               limit: 30,                             default: "draft", null: false
    t.integer  "user_id",                   limit: 4,                                                null: false
    t.integer  "submiter_id",               limit: 4
    t.integer  "submit_date",               limit: 4
    t.integer  "checker_id",                limit: 4
    t.date     "check_date"
    t.string   "check_opinion",             limit: 60
    t.string   "name",                      limit: 60,                                               null: false
    t.text     "note",                      limit: 65535
    t.integer  "k_safety_table_marks",      limit: 4,                              default: 0
    t.integer  "k_accident_marks",          limit: 4,                              default: 0
    t.integer  "k_training_marks",          limit: 4,                              default: 0
    t.integer  "k_planb_doc_marks",         limit: 4,                              default: 0
    t.integer  "k_meeting_marks",           limit: 4,                              default: 0
    t.integer  "k_hidden_danger_marks",     limit: 4,                              default: 0
    t.integer  "k_big_hidden_danger_marks", limit: 4,                              default: 0
    t.integer  "k_big_accident_marks",      limit: 4,                              default: 0
    t.integer  "k_punishment_marks",        limit: 4,                              default: 0
    t.integer  "reward_marks",              limit: 4,                              default: 0
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
    t.decimal  "k_files_marks",                           precision: 10, scale: 2, default: 0.0
  end

  add_index "assessments", ["org_id"], name: "index_assessments_on_org_id", using: :btree
  add_index "assessments", ["user_id"], name: "index_assessments_on_user_id", using: :btree

  create_table "base_purchase_orders", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "bill_no",       limit: 255
    t.integer  "org_id",        limit: 4
    t.date     "bill_date"
    t.integer  "user_id",       limit: 4
    t.integer  "f_location_id", limit: 4,     null: false
    t.integer  "t_location_id", limit: 4,     null: false
    t.string   "operator",      limit: 30
    t.string   "state",         limit: 30,    null: false
    t.string   "type",          limit: 60
    t.integer  "confirmer_id",  limit: 4
    t.date     "confirm_date"
    t.text     "note",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "base_purchase_orders", ["bill_date"], name: "index_base_purchase_orders_on_bill_date", using: :btree
  add_index "base_purchase_orders", ["confirmer_id"], name: "index_base_purchase_orders_on_confirmer_id", using: :btree
  add_index "base_purchase_orders", ["f_location_id"], name: "index_base_purchase_orders_on_f_location_id", using: :btree
  add_index "base_purchase_orders", ["org_id"], name: "index_base_purchase_orders_on_org_id", using: :btree
  add_index "base_purchase_orders", ["t_location_id"], name: "index_base_purchase_orders_on_t_location_id", using: :btree
  add_index "base_purchase_orders", ["user_id"], name: "index_base_purchase_orders_on_user_id", using: :btree

  create_table "drivers", force: :cascade do |t|
    t.integer  "org_id",          limit: 4,                    null: false
    t.string   "name",            limit: 60,                   null: false
    t.integer  "vehicle_id",      limit: 4,                    null: false
    t.string   "driver_no",       limit: 30
    t.string   "id_no",           limit: 30
    t.string   "mobile",          limit: 20
    t.date     "next_check_date"
    t.boolean  "is_active",       limit: 1,     default: true
    t.text     "note",            limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "drivers", ["org_id"], name: "index_drivers_on_org_id", using: :btree
  add_index "drivers", ["vehicle_id"], name: "index_drivers_on_vehicle_id", using: :btree

  create_table "electric_equipments", force: :cascade do |t|
    t.integer  "org_id",          limit: 4,                                             null: false
    t.decimal  "area",                          precision: 10
    t.integer  "fire_level",      limit: 4
    t.date     "build_date"
    t.integer  "manage_org_id",   limit: 4
    t.integer  "qty",             limit: 4,                              default: 1
    t.date     "buy_date"
    t.integer  "power",           limit: 4
    t.decimal  "volume",                        precision: 15, scale: 2, default: 10.0
    t.string   "work_type",       limit: 255
    t.date     "last_check_date"
    t.boolean  "is_active",       limit: 1,                              default: true
    t.string   "type",            limit: 60,                                            null: false
    t.text     "note",            limit: 65535
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "electric_equipments", ["manage_org_id"], name: "index_electric_equipments_on_manage_org_id", using: :btree
  add_index "electric_equipments", ["org_id"], name: "index_electric_equipments_on_org_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer  "org_id",              limit: 4,                    null: false
    t.string   "name",                limit: 30,                   null: false
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
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "user_id",             limit: 4
    t.boolean  "is_active",           limit: 1,     default: true
  end

  add_index "employees", ["name"], name: "index_employees_on_name", using: :btree
  add_index "employees", ["org_id"], name: "index_employees_on_org_id", using: :btree
  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

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
    t.string   "type",                  limit: 60
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

  create_table "fire_fighting_equipments", force: :cascade do |t|
    t.integer  "org_id",           limit: 4,                    null: false
    t.string   "name",             limit: 60,                   null: false
    t.string   "model",            limit: 60
    t.string   "location",         limit: 6
    t.integer  "qty",              limit: 4,     default: 1
    t.integer  "unit_id",          limit: 4
    t.date     "out_factory_date"
    t.integer  "use_year",         limit: 4
    t.date     "valid_date"
    t.date     "last_upkeep_date"
    t.text     "note",             limit: 65535
    t.integer  "user_id",          limit: 4
    t.string   "duty_person",      limit: 30
    t.boolean  "is_active",        limit: 1,     default: true
    t.integer  "order_by",         limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "fire_fighting_equipments", ["org_id"], name: "index_fire_fighting_equipments_on_org_id", using: :btree
  add_index "fire_fighting_equipments", ["user_id"], name: "index_fire_fighting_equipments_on_user_id", using: :btree

  create_table "hidden_dangers", force: :cascade do |t|
    t.integer  "org_id",                     limit: 4,                                                null: false
    t.integer  "user_id",                    limit: 4,                                                null: false
    t.integer  "deliver_id",                 limit: 4
    t.date     "deliver_date"
    t.date     "table_date",                                                                          null: false
    t.integer  "danger_org_id",              limit: 4,                                                null: false
    t.integer  "parent_id",                  limit: 4
    t.string   "name",                       limit: 60,                                               null: false
    t.date     "danger_date",                                                                         null: false
    t.integer  "fix_period",                 limit: 4,                                                null: false
    t.string   "fixed_state",                limit: 30,                             default: "draft", null: false
    t.date     "fixed_date"
    t.integer  "fixer_id",                   limit: 4
    t.date     "review_date"
    t.string   "review_state",               limit: 255,                            default: "draft", null: false
    t.integer  "reviewer_id",                limit: 4
    t.text     "note",                       limit: 65535
    t.datetime "created_at",                                                                          null: false
    t.datetime "updated_at",                                                                          null: false
    t.boolean  "is_big",                     limit: 1,                              default: false
    t.text     "fixed_note",                 limit: 65535
    t.text     "review_note",                limit: 65535
    t.string   "bill_no",                    limit: 255,                                              null: false
    t.string   "checker_name",               limit: 30
    t.date     "check_date"
    t.decimal  "k_marks",                                  precision: 15, scale: 2, default: 0.0
    t.string   "photo_1_file_name",          limit: 255
    t.string   "photo_1_content_type",       limit: 255
    t.integer  "photo_1_file_size",          limit: 4
    t.datetime "photo_1_updated_at"
    t.string   "photo_2_file_name",          limit: 255
    t.string   "photo_2_content_type",       limit: 255
    t.integer  "photo_2_file_size",          limit: 4
    t.datetime "photo_2_updated_at"
    t.string   "photo_3_file_name",          limit: 255
    t.string   "photo_3_content_type",       limit: 255
    t.integer  "photo_3_file_size",          limit: 4
    t.datetime "photo_3_updated_at"
    t.string   "photo_4_file_name",          limit: 255
    t.string   "photo_4_content_type",       limit: 255
    t.integer  "photo_4_file_size",          limit: 4
    t.datetime "photo_4_updated_at"
    t.string   "photo_5_file_name",          limit: 255
    t.string   "photo_5_content_type",       limit: 255
    t.integer  "photo_5_file_size",          limit: 4
    t.datetime "photo_5_updated_at"
    t.string   "photo_6_file_name",          limit: 255
    t.string   "photo_6_content_type",       limit: 255
    t.integer  "photo_6_file_size",          limit: 4
    t.datetime "photo_6_updated_at"
    t.string   "fixed_photo_1_file_name",    limit: 255
    t.string   "fixed_photo_1_content_type", limit: 255
    t.integer  "fixed_photo_1_file_size",    limit: 4
    t.datetime "fixed_photo_1_updated_at"
    t.string   "fixed_photo_2_file_name",    limit: 255
    t.string   "fixed_photo_2_content_type", limit: 255
    t.integer  "fixed_photo_2_file_size",    limit: 4
    t.datetime "fixed_photo_2_updated_at"
    t.string   "fixed_photo_3_file_name",    limit: 255
    t.string   "fixed_photo_3_content_type", limit: 255
    t.integer  "fixed_photo_3_file_size",    limit: 4
    t.datetime "fixed_photo_3_updated_at"
    t.string   "fixed_photo_4_file_name",    limit: 255
    t.string   "fixed_photo_4_content_type", limit: 255
    t.integer  "fixed_photo_4_file_size",    limit: 4
    t.datetime "fixed_photo_4_updated_at"
    t.string   "fixed_photo_5_file_name",    limit: 255
    t.string   "fixed_photo_5_content_type", limit: 255
    t.integer  "fixed_photo_5_file_size",    limit: 4
    t.datetime "fixed_photo_5_updated_at"
    t.string   "fixed_photo_6_file_name",    limit: 255
    t.string   "fixed_photo_6_content_type", limit: 255
    t.integer  "fixed_photo_6_file_size",    limit: 4
    t.datetime "fixed_photo_6_updated_at"
    t.integer  "review_count",               limit: 4,                              default: 0
    t.integer  "postponement_days",          limit: 4,                              default: 0
    t.integer  "postponement_oper_id",       limit: 4
    t.string   "postponement_date",          limit: 255
    t.text     "postponement_note",          limit: 65535
  end

  add_index "hidden_dangers", ["danger_org_id"], name: "index_hidden_dangers_on_danger_org_id", using: :btree
  add_index "hidden_dangers", ["deliver_date"], name: "index_hidden_dangers_on_deliver_date", using: :btree
  add_index "hidden_dangers", ["deliver_id"], name: "index_hidden_dangers_on_deliver_id", using: :btree
  add_index "hidden_dangers", ["org_id"], name: "index_hidden_dangers_on_org_id", using: :btree
  add_index "hidden_dangers", ["user_id"], name: "index_hidden_dangers_on_user_id", using: :btree

  create_table "houses", force: :cascade do |t|
    t.integer  "org_id",             limit: 4,                                              null: false
    t.string   "name",               limit: 60,                                             null: false
    t.string   "location",           limit: 60
    t.date     "build_date"
    t.decimal  "building_area",                    precision: 15, scale: 2
    t.boolean  "is_rent",            limit: 1,                              default: false
    t.string   "usage",              limit: 60
    t.boolean  "have_safe_contract", limit: 1,                              default: true
    t.date     "rent_to"
    t.boolean  "is_active",          limit: 1,                              default: true
    t.text     "note",               limit: 65535
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
  end

  add_index "houses", ["org_id"], name: "index_houses_on_org_id", using: :btree

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
    t.string   "bill_no",       limit: 30
    t.string   "ref_partner",   limit: 60
    t.string   "name",          limit: 60
    t.integer  "confirmer_id",  limit: 4
    t.date     "confirm_date"
  end

  add_index "inout_bills", ["user_id"], name: "index_inout_bills_on_user_id", using: :btree

  create_table "inout_lines", force: :cascade do |t|
    t.integer  "equipment_id",  limit: 4,                                        null: false
    t.integer  "inout_bill_id", limit: 4,                                        null: false
    t.integer  "f_location_id", limit: 4,                                        null: false
    t.integer  "t_location_id", limit: 4,                                        null: false
    t.date     "move_date"
    t.string   "state",         limit: 60
    t.integer  "qty",           limit: 4,                            default: 1
    t.decimal  "price",                     precision: 15, scale: 2
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "no",            limit: 30
    t.string   "brand",         limit: 40
    t.string   "model",         limit: 60
    t.date     "purchase_date"
    t.integer  "own_org_id",    limit: 4
    t.string   "duty_person",   limit: 30
    t.string   "note",          limit: 255
  end

  add_index "inout_lines", ["inout_bill_id"], name: "index_inout_lines_on_inout_bill_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",          limit: 30,                           null: false
    t.integer  "warehouse_id",  limit: 4
    t.string   "x",             limit: 20,    default: "0"
    t.string   "y",             limit: 20,    default: "0"
    t.string   "z",             limit: 20,    default: "0"
    t.integer  "order_by",      limit: 4,     default: 1
    t.boolean  "is_active",     limit: 1,     default: true
    t.text     "note",          limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "location_type", limit: 60,    default: "normal_loc", null: false
  end

  add_index "locations", ["warehouse_id"], name: "index_locations_on_warehouse_id", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.integer  "org_id",               limit: 4
    t.integer  "user_id",              limit: 4
    t.date     "table_date"
    t.string   "name",                 limit: 60,                      null: false
    t.date     "meeting_date",                                         null: false
    t.integer  "meeting_length",       limit: 4,     default: 2,       null: false
    t.string   "presenter",            limit: 30,                      null: false
    t.string   "join_persons",         limit: 200,                     null: false
    t.integer  "join_count",           limit: 4,     default: 10,      null: false
    t.text     "meeting_content",      limit: 65535,                   null: false
    t.string   "check_state",          limit: 30,    default: "draft"
    t.string   "check_opinion",        limit: 100
    t.integer  "checker_id",           limit: 4
    t.date     "check_date"
    t.text     "note",                 limit: 65535
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "photo_1_file_name",    limit: 255
    t.string   "photo_1_content_type", limit: 255
    t.integer  "photo_1_file_size",    limit: 4
    t.datetime "photo_1_updated_at"
    t.string   "photo_2_file_name",    limit: 255
    t.string   "photo_2_content_type", limit: 255
    t.integer  "photo_2_file_size",    limit: 4
    t.datetime "photo_2_updated_at"
    t.string   "photo_3_file_name",    limit: 255
    t.string   "photo_3_content_type", limit: 255
    t.integer  "photo_3_file_size",    limit: 4
    t.datetime "photo_3_updated_at"
    t.string   "photo_4_file_name",    limit: 255
    t.string   "photo_4_content_type", limit: 255
    t.integer  "photo_4_file_size",    limit: 4
    t.datetime "photo_4_updated_at"
    t.string   "photo_5_file_name",    limit: 255
    t.string   "photo_5_content_type", limit: 255
    t.integer  "photo_5_file_size",    limit: 4
    t.datetime "photo_5_updated_at"
    t.string   "photo_6_file_name",    limit: 255
    t.string   "photo_6_content_type", limit: 255
    t.integer  "photo_6_file_size",    limit: 4
    t.datetime "photo_6_updated_at"
    t.string   "photo_7_file_name",    limit: 255
    t.string   "photo_7_content_type", limit: 255
    t.integer  "photo_7_file_size",    limit: 4
    t.datetime "photo_7_updated_at"
    t.integer  "submitter_id",         limit: 4
    t.date     "submit_date"
    t.text     "submit_note",          limit: 65535
  end

  add_index "meetings", ["org_id"], name: "index_meetings_on_org_id", using: :btree
  add_index "meetings", ["user_id"], name: "index_meetings_on_user_id", using: :btree

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
    t.string   "code",       limit: 30
  end

  create_table "planb_docs", force: :cascade do |t|
    t.integer  "org_id",               limit: 4,                       null: false
    t.date     "table_date"
    t.integer  "user_id",              limit: 4,                       null: false
    t.string   "name",                 limit: 60,                      null: false
    t.date     "plan_date",                                            null: false
    t.integer  "plan_length",          limit: 4,     default: 10,      null: false
    t.string   "plan_type",            limit: 30,                      null: false
    t.string   "join_persons",         limit: 100,                     null: false
    t.integer  "join_count",           limit: 4,     default: 20,      null: false
    t.text     "plan_content",         limit: 65535,                   null: false
    t.text     "plan_process",         limit: 65535,                   null: false
    t.string   "document_name",        limit: 60,                      null: false
    t.date     "audit_date",                                           null: false
    t.string   "audit_persons",        limit: 60,                      null: false
    t.boolean  "audit_item_1_state",   limit: 1,     default: true,    null: false
    t.boolean  "audit_item_2_state",   limit: 1,     default: true,    null: false
    t.boolean  "audit_item_3_state",   limit: 1,     default: true,    null: false
    t.boolean  "audit_item_4_state",   limit: 1,     default: true,    null: false
    t.boolean  "audit_item_5_state",   limit: 1,     default: true,    null: false
    t.boolean  "audit_item_6_state",   limit: 1,     default: true,    null: false
    t.boolean  "audit_item_7_state",   limit: 1,     default: true,    null: false
    t.string   "audit_item_1_fix",     limit: 60
    t.string   "audit_item_2_fix",     limit: 60
    t.string   "audit_item_3_fix",     limit: 60
    t.string   "audit_item_4_fix",     limit: 60
    t.string   "audit_item_5_fix",     limit: 60
    t.string   "audit_item_6_fix",     limit: 60
    t.string   "audit_item_7_fix",     limit: 60
    t.text     "note",                 limit: 65535,                   null: false
    t.string   "check_leader",         limit: 60,                      null: false
    t.string   "note_taker",           limit: 60,                      null: false
    t.integer  "checker_id",           limit: 4
    t.string   "check_state",          limit: 255,   default: "draft", null: false
    t.string   "check_opinion",        limit: 255
    t.date     "check_date"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "photo_1_file_name",    limit: 255
    t.string   "photo_1_content_type", limit: 255
    t.integer  "photo_1_file_size",    limit: 4
    t.datetime "photo_1_updated_at"
    t.string   "photo_2_file_name",    limit: 255
    t.string   "photo_2_content_type", limit: 255
    t.integer  "photo_2_file_size",    limit: 4
    t.datetime "photo_2_updated_at"
    t.string   "photo_3_file_name",    limit: 255
    t.string   "photo_3_content_type", limit: 255
    t.integer  "photo_3_file_size",    limit: 4
    t.datetime "photo_3_updated_at"
    t.string   "photo_4_file_name",    limit: 255
    t.string   "photo_4_content_type", limit: 255
    t.integer  "photo_4_file_size",    limit: 4
    t.datetime "photo_4_updated_at"
    t.string   "photo_5_file_name",    limit: 255
    t.string   "photo_5_content_type", limit: 255
    t.integer  "photo_5_file_size",    limit: 4
    t.datetime "photo_5_updated_at"
    t.string   "photo_6_file_name",    limit: 255
    t.string   "photo_6_content_type", limit: 255
    t.integer  "photo_6_file_size",    limit: 4
    t.datetime "photo_6_updated_at"
    t.string   "photo_7_file_name",    limit: 255
    t.string   "photo_7_content_type", limit: 255
    t.integer  "photo_7_file_size",    limit: 4
    t.datetime "photo_7_updated_at"
    t.string   "photo_8_file_name",    limit: 255
    t.string   "photo_8_content_type", limit: 255
    t.integer  "photo_8_file_size",    limit: 4
    t.datetime "photo_8_updated_at"
    t.integer  "submitter_id",         limit: 4
    t.date     "submit_date"
    t.text     "submit_note",          limit: 65535
  end

  add_index "planb_docs", ["org_id"], name: "index_planb_docs_on_org_id", using: :btree
  add_index "planb_docs", ["user_id"], name: "index_planb_docs_on_user_id", using: :btree

  create_table "po_lines", force: :cascade do |t|
    t.integer  "equipment_id",           limit: 4
    t.integer  "base_purchase_order_id", limit: 4
    t.string   "state",                  limit: 60
    t.integer  "qty",                    limit: 4,                           default: 1
    t.decimal  "price",                             precision: 15, scale: 2, default: 0.0
    t.string   "brand",                  limit: 60
    t.string   "model",                  limit: 60
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "po_lines", ["base_purchase_order_id"], name: "index_po_lines_on_base_purchase_order_id", using: :btree
  add_index "po_lines", ["equipment_id"], name: "index_po_lines_on_equipment_id", using: :btree

  create_table "protect_equipment_categories", force: :cascade do |t|
    t.string   "name",       limit: 60,                null: false
    t.integer  "order_by",   limit: 4,  default: 1
    t.boolean  "is_active",  limit: 1,  default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "protect_equipments", force: :cascade do |t|
    t.integer  "protect_equipment_category_id", limit: 4,                    null: false
    t.integer  "org_id",                        limit: 4,                    null: false
    t.string   "name",                          limit: 60,                   null: false
    t.integer  "deliver_org_id",                limit: 4
    t.string   "post",                          limit: 30
    t.integer  "qty",                           limit: 4,     default: 10
    t.integer  "unit_id",                       limit: 4
    t.integer  "save_days",                     limit: 4
    t.integer  "maintain_days",                 limit: 4
    t.boolean  "is_active",                     limit: 1,     default: true
    t.text     "note",                          limit: 65535
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "protect_equipments", ["org_id"], name: "index_protect_equipments_on_org_id", using: :btree
  add_index "protect_equipments", ["protect_equipment_category_id"], name: "index_protect_equipments_on_protect_equipment_category_id", using: :btree
  add_index "protect_equipments", ["unit_id"], name: "index_protect_equipments_on_unit_id", using: :btree

  create_table "punishments", force: :cascade do |t|
    t.integer  "org_id",        limit: 4,                       null: false
    t.integer  "user_id",       limit: 4,                       null: false
    t.integer  "punish_org_id", limit: 4,                       null: false
    t.date     "table_date",                                    null: false
    t.string   "name",          limit: 60,                      null: false
    t.integer  "marks",         limit: 4,     default: 0
    t.text     "note",          limit: 65535
    t.integer  "poster_id",     limit: 4
    t.date     "post_date"
    t.date     "punish_date"
    t.string   "check_state",   limit: 30,    default: "draft"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "punishments", ["org_id"], name: "index_punishments_on_org_id", using: :btree
  add_index "punishments", ["punish_org_id"], name: "index_punishments_on_punish_org_id", using: :btree
  add_index "punishments", ["table_date"], name: "index_punishments_on_table_date", using: :btree
  add_index "punishments", ["user_id"], name: "index_punishments_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.integer  "org_id",               limit: 4,                       null: false
    t.date     "table_date",                                           null: false
    t.integer  "user_id",              limit: 4,                       null: false
    t.integer  "checker_id",           limit: 4
    t.string   "check_state",          limit: 60,    default: "draft"
    t.date     "check_date"
    t.text     "note",                 limit: 65535
    t.integer  "marks",                limit: 4,     default: 0
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "photo_1_file_name",    limit: 255
    t.string   "photo_1_content_type", limit: 255
    t.integer  "photo_1_file_size",    limit: 4
    t.datetime "photo_1_updated_at"
    t.string   "photo_2_file_name",    limit: 255
    t.string   "photo_2_content_type", limit: 255
    t.integer  "photo_2_file_size",    limit: 4
    t.datetime "photo_2_updated_at"
    t.string   "photo_3_file_name",    limit: 255
    t.string   "photo_3_content_type", limit: 255
    t.integer  "photo_3_file_size",    limit: 4
    t.datetime "photo_3_updated_at"
    t.string   "photo_4_file_name",    limit: 255
    t.string   "photo_4_content_type", limit: 255
    t.integer  "photo_4_file_size",    limit: 4
    t.datetime "photo_4_updated_at"
    t.string   "photo_5_file_name",    limit: 255
    t.string   "photo_5_content_type", limit: 255
    t.integer  "photo_5_file_size",    limit: 4
    t.datetime "photo_5_updated_at"
    t.string   "photo_6_file_name",    limit: 255
    t.string   "photo_6_content_type", limit: 255
    t.integer  "photo_6_file_size",    limit: 4
    t.datetime "photo_6_updated_at"
    t.string   "photo_7_file_name",    limit: 255
    t.string   "photo_7_content_type", limit: 255
    t.integer  "photo_7_file_size",    limit: 4
    t.datetime "photo_7_updated_at"
    t.string   "name",                 limit: 45,                      null: false
    t.string   "check_opinion",        limit: 600
  end

  add_index "rewards", ["org_id"], name: "index_rewards_on_org_id", using: :btree
  add_index "rewards", ["user_id"], name: "index_rewards_on_user_id", using: :btree

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

  create_table "safety_tables", force: :cascade do |t|
    t.integer  "org_id",                         limit: 4,                                                null: false
    t.string   "mth",                            limit: 6,                                                null: false
    t.integer  "safety_check_count",             limit: 4,                              default: 0
    t.integer  "special_safety_check_count",     limit: 4,                              default: 0
    t.integer  "evening_safety_check_count",     limit: 4,                              default: 0
    t.integer  "danger_count",                   limit: 4,                              default: 0
    t.integer  "fixed_danger_count",             limit: 4,                              default: 0
    t.integer  "third_edu_persons",              limit: 4,                              default: 0
    t.decimal  "third_edu_percent",                            precision: 15, scale: 2
    t.integer  "special_worker_edu_persons",     limit: 4,                              default: 0
    t.decimal  "special_worker_edu_percent",                   precision: 15, scale: 2
    t.integer  "common_edu_persons",             limit: 4,                              default: 0
    t.integer  "no_duplicate_persons",           limit: 4,                              default: 0
    t.decimal  "common_edu_percent",                           precision: 15, scale: 2
    t.decimal  "invest_equipment_money",                       precision: 15, scale: 2
    t.decimal  "invest_faclities_money",                       precision: 15, scale: 2
    t.decimal  "fixed_danger_money",                           precision: 15, scale: 2
    t.decimal  "safety_edu_money",                             precision: 15, scale: 2
    t.decimal  "safety_reward_money",                          precision: 15, scale: 2
    t.integer  "safety_meeting_count",           limit: 4,                              default: 0
    t.integer  "safety_meeting_persons",         limit: 4,                              default: 0
    t.integer  "safety_meeting_solve_questions", limit: 4,                              default: 0
    t.date     "table_date"
    t.integer  "user_id",                        limit: 4
    t.datetime "created_at",                                                                              null: false
    t.datetime "updated_at",                                                                              null: false
    t.integer  "submitter_id",                   limit: 4
    t.date     "submit_date"
    t.text     "submit_note",                    limit: 65535
    t.string   "check_state",                    limit: 30,                             default: "draft"
    t.integer  "checker_id",                     limit: 4
    t.text     "check_opinion",                  limit: 65535
    t.date     "check_date"
  end

  add_index "safety_tables", ["org_id"], name: "index_safety_tables_on_org_id", using: :btree
  add_index "safety_tables", ["user_id"], name: "index_safety_tables_on_user_id", using: :btree

  create_table "salary_item_headers", force: :cascade do |t|
    t.integer  "org_id",     limit: 4
    t.string   "name",       limit: 60,                   null: false
    t.integer  "order_by",   limit: 4,     default: 1
    t.boolean  "is_active",  limit: 1,     default: true
    t.text     "note",       limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "salary_item_headers", ["org_id"], name: "index_salary_item_headers_on_org_id", using: :btree

  create_table "salary_items", force: :cascade do |t|
    t.integer  "salary_item_header_id", limit: 4,                         null: false
    t.string   "name",                  limit: 30,                        null: false
    t.string   "code",                  limit: 255,                       null: false
    t.integer  "order_by",              limit: 4,   default: 1
    t.string   "item_type",             limit: 30,  default: "plus_item"
    t.boolean  "is_active",             limit: 1,   default: true
    t.boolean  "is_calculate",          limit: 1,   default: false
    t.string   "formula",               limit: 300
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "salary_table_lines", force: :cascade do |t|
    t.integer  "salary_table_id", limit: 4,                                        null: false
    t.integer  "employee_id",     limit: 4
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.decimal  "pay_item_1",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_2",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_3",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_4",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_5",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_6",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_7",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_8",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_9",                precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_10",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_11",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_12",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_13",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_14",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_15",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_16",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_17",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_18",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_19",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_20",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_21",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_22",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_23",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_24",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_25",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_26",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_27",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_28",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_29",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_30",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_31",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_32",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_33",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_34",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_35",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_36",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_37",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_38",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_39",               precision: 15, scale: 2, default: 0.0
    t.decimal  "pay_item_40",               precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_1",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_2",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_3",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_4",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_5",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_6",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_7",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_8",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_9",             precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_10",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_11",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_12",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_13",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_14",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_15",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_16",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_17",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_18",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_19",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_20",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_21",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_22",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_23",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_24",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_25",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_26",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_27",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_28",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_29",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_30",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_31",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_32",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_33",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_34",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_35",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_36",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_37",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_38",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_39",            precision: 15, scale: 2, default: 0.0
    t.decimal  "deduct_item_40",            precision: 15, scale: 2, default: 0.0
  end

  add_index "salary_table_lines", ["employee_id"], name: "index_salary_table_lines_on_employee_id", using: :btree
  add_index "salary_table_lines", ["salary_table_id"], name: "index_salary_table_lines_on_salary_table_id", using: :btree

  create_table "salary_tables", force: :cascade do |t|
    t.integer  "org_id",     limit: 4
    t.string   "name",       limit: 60,    null: false
    t.string   "mth",        limit: 6,     null: false
    t.date     "table_date"
    t.text     "note",       limit: 65535
    t.integer  "user_id",    limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "salary_tables", ["org_id"], name: "index_salary_tables_on_org_id", using: :btree
  add_index "salary_tables", ["user_id"], name: "index_salary_tables_on_user_id", using: :btree

  create_table "spec_equipments", force: :cascade do |t|
    t.string   "equip_type",      limit: 20,                                            null: false
    t.integer  "org_id",          limit: 4,                                             null: false
    t.date     "equip_date"
    t.string   "vendor",          limit: 60
    t.string   "model",           limit: 50
    t.string   "location",        limit: 60
    t.decimal  "ton",                           precision: 10, scale: 2, default: 1.0
    t.decimal  "volume",                        precision: 10, scale: 2, default: 1.0
    t.string   "usage",           limit: 60
    t.date     "last_check_date"
    t.text     "note",            limit: 65535
    t.boolean  "is_active",       limit: 1,                              default: true
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "spec_equipments", ["org_id"], name: "index_spec_equipments_on_org_id", using: :btree

  create_table "spec_warehouses", force: :cascade do |t|
    t.string   "warehouse_type",                limit: 20,                                               null: false
    t.string   "name",                          limit: 60,                                               null: false
    t.integer  "org_id",                        limit: 4,                                                null: false
    t.string   "location",                      limit: 60
    t.date     "build_date"
    t.decimal  "building_area",                               precision: 15, scale: 2
    t.integer  "room_count",                    limit: 4,                              default: 1
    t.integer  "fire_level",                    limit: 4,                              default: 1
    t.decimal  "max_volume",                                  precision: 15, scale: 2, default: 10000.0
    t.decimal  "act_volume",                                  precision: 15, scale: 2, default: 10000.0
    t.boolean  "is_camera_moniter",             limit: 1,                              default: true
    t.boolean  "is_fire_fighting_alarm_system", limit: 1,                              default: true
    t.boolean  "is_auto_fire_fighting_system",  limit: 1,                              default: true
    t.boolean  "is_fire_hydrant_system",        limit: 1,                              default: true
    t.boolean  "is_lightning_protector",        limit: 1,                              default: true
    t.boolean  "is_active",                     limit: 1,                              default: true
    t.text     "note",                          limit: 65535
    t.datetime "created_at",                                                                             null: false
    t.datetime "updated_at",                                                                             null: false
  end

  add_index "spec_warehouses", ["org_id"], name: "index_spec_warehouses_on_org_id", using: :btree

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
    t.string   "target",                   limit: 30
  end

  add_index "system_functions", ["system_function_group_id"], name: "index_system_functions_on_system_function_group_id", using: :btree

  create_table "task_categories", force: :cascade do |t|
    t.string   "name",       limit: 60,                   null: false
    t.integer  "order_by",   limit: 4,     default: 1
    t.boolean  "is_active",  limit: 1,     default: true
    t.text     "note",       limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "task_lines", force: :cascade do |t|
    t.integer  "task_id",    limit: 4,     null: false
    t.text     "note",       limit: 65535, null: false
    t.date     "line_date",                null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "task_lines", ["task_id"], name: "index_task_lines_on_task_id", using: :btree
  add_index "task_lines", ["user_id"], name: "index_task_lines_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "org_id",           limit: 4,                       null: false
    t.integer  "user_id",          limit: 4,                       null: false
    t.integer  "task_category_id", limit: 4
    t.date     "task_date"
    t.string   "name",             limit: 60,                      null: false
    t.text     "note",             limit: 65535
    t.integer  "executer_id",      limit: 4,                       null: false
    t.string   "state",            limit: 30,    default: "draft", null: false
    t.integer  "deliver_id",       limit: 4
    t.date     "deliver_date"
    t.integer  "finisher_id",      limit: 4
    t.date     "finish_date"
    t.date     "confirm_date"
    t.integer  "confirmer_id",     limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "tasks", ["deliver_date"], name: "index_tasks_on_deliver_date", using: :btree
  add_index "tasks", ["deliver_id"], name: "index_tasks_on_deliver_id", using: :btree
  add_index "tasks", ["finish_date"], name: "index_tasks_on_finish_date", using: :btree
  add_index "tasks", ["finisher_id"], name: "index_tasks_on_finisher_id", using: :btree
  add_index "tasks", ["org_id"], name: "index_tasks_on_org_id", using: :btree
  add_index "tasks", ["task_category_id"], name: "index_tasks_on_task_category_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "temporary_employees", force: :cascade do |t|
    t.integer  "org_id",         limit: 4,                    null: false
    t.string   "name",           limit: 30,                   null: false
    t.string   "gender",         limit: 10
    t.string   "id_no",          limit: 30
    t.integer  "manage_org_id",  limit: 4
    t.string   "post",           limit: 30
    t.string   "belong_to_unit", limit: 60
    t.date     "begin_date"
    t.string   "mobile",         limit: 60
    t.boolean  "is_active",      limit: 1,     default: true
    t.text     "note",           limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "temporary_employees", ["org_id"], name: "index_temporary_employees_on_org_id", using: :btree

  create_table "trainings", force: :cascade do |t|
    t.integer  "org_id",               limit: 4,                                                null: false
    t.date     "table_date",                                                                    null: false
    t.integer  "user_id",              limit: 4
    t.string   "name",                 limit: 60,                                               null: false
    t.date     "training_date",                                                                 null: false
    t.string   "teachers",             limit: 255,                                              null: false
    t.integer  "training_length",      limit: 4,                              default: 1,       null: false
    t.string   "join_persons",         limit: 255,                                              null: false
    t.integer  "join_count",           limit: 4,                              default: 10
    t.text     "training_content",     limit: 65535
    t.boolean  "is_assess",            limit: 1,                              default: false
    t.string   "assess_type",          limit: 20
    t.decimal  "qualified_rate",                     precision: 15, scale: 2
    t.string   "check_state",          limit: 255,                            default: "draft", null: false
    t.text     "check_opinion",        limit: 65535
    t.integer  "checker_id",           limit: 4
    t.date     "check_date"
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.string   "photo_1_file_name",    limit: 255
    t.string   "photo_1_content_type", limit: 255
    t.integer  "photo_1_file_size",    limit: 4
    t.datetime "photo_1_updated_at"
    t.string   "photo_2_file_name",    limit: 255
    t.string   "photo_2_content_type", limit: 255
    t.integer  "photo_2_file_size",    limit: 4
    t.datetime "photo_2_updated_at"
    t.string   "photo_3_file_name",    limit: 255
    t.string   "photo_3_content_type", limit: 255
    t.integer  "photo_3_file_size",    limit: 4
    t.datetime "photo_3_updated_at"
    t.string   "photo_4_file_name",    limit: 255
    t.string   "photo_4_content_type", limit: 255
    t.integer  "photo_4_file_size",    limit: 4
    t.datetime "photo_4_updated_at"
    t.string   "photo_5_file_name",    limit: 255
    t.string   "photo_5_content_type", limit: 255
    t.integer  "photo_5_file_size",    limit: 4
    t.datetime "photo_5_updated_at"
    t.string   "photo_6_file_name",    limit: 255
    t.string   "photo_6_content_type", limit: 255
    t.integer  "photo_6_file_size",    limit: 4
    t.datetime "photo_6_updated_at"
    t.string   "photo_7_file_name",    limit: 255
    t.string   "photo_7_content_type", limit: 255
    t.integer  "photo_7_file_size",    limit: 4
    t.datetime "photo_7_updated_at"
    t.integer  "submitter_id",         limit: 4
    t.date     "submit_date"
    t.text     "submit_note",          limit: 65535
  end

  add_index "trainings", ["org_id"], name: "index_trainings_on_org_id", using: :btree
  add_index "trainings", ["user_id"], name: "index_trainings_on_user_id", using: :btree

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
    t.integer  "location_id",   limit: 4,                             null: false
    t.integer  "equipment_id",  limit: 4,                             null: false
    t.decimal  "qty",                      precision: 33, default: 0, null: false
    t.string   "no",            limit: 30
    t.string   "brand",         limit: 40
    t.string   "model",         limit: 60
    t.date     "purchase_date"
    t.integer  "own_org_id",    limit: 4
    t.string   "duty_person",   limit: 30
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "v_stock_asset", id: false, force: :cascade do |t|
    t.integer  "location_id",   limit: 4,                             null: false
    t.integer  "equipment_id",  limit: 4,                             null: false
    t.decimal  "qty",                      precision: 33, default: 0, null: false
    t.string   "no",            limit: 30
    t.string   "brand",         limit: 40
    t.string   "model",         limit: 60
    t.date     "purchase_date"
    t.integer  "own_org_id",    limit: 4
    t.string   "duty_person",   limit: 30
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "v_stock_asset_in", id: false, force: :cascade do |t|
    t.integer "t_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.date    "purchase_date"
    t.integer "own_org_id",    limit: 4
    t.string  "duty_person",   limit: 30
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_asset_out", id: false, force: :cascade do |t|
    t.integer "f_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.date    "purchase_date"
    t.integer "own_org_id",    limit: 4
    t.string  "duty_person",   limit: 30
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_consume", id: false, force: :cascade do |t|
    t.integer  "location_id",  limit: 4,                             null: false
    t.integer  "equipment_id", limit: 4,                             null: false
    t.decimal  "qty",                     precision: 33, default: 0, null: false
    t.string   "brand",        limit: 40
    t.string   "model",        limit: 60
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "v_stock_consume_in", id: false, force: :cascade do |t|
    t.integer "t_location_id", limit: 4,                           null: false
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_consume_out", id: false, force: :cascade do |t|
    t.integer "f_location_id", limit: 4,                           null: false
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_in", id: false, force: :cascade do |t|
    t.integer "t_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.date    "purchase_date"
    t.integer "own_org_id",    limit: 4
    t.string  "duty_person",   limit: 30
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_it", id: false, force: :cascade do |t|
    t.integer  "location_id",   limit: 4,                             null: false
    t.integer  "equipment_id",  limit: 4,                             null: false
    t.decimal  "qty",                      precision: 33, default: 0, null: false
    t.string   "no",            limit: 30
    t.string   "brand",         limit: 40
    t.string   "model",         limit: 60
    t.date     "purchase_date"
    t.integer  "own_org_id",    limit: 4
    t.string   "duty_person",   limit: 30
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "v_stock_it_in", id: false, force: :cascade do |t|
    t.integer "t_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.date    "purchase_date"
    t.integer "own_org_id",    limit: 4
    t.string  "duty_person",   limit: 30
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_it_out", id: false, force: :cascade do |t|
    t.integer "f_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.date    "purchase_date"
    t.integer "own_org_id",    limit: 4
    t.string  "duty_person",   limit: 30
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_out", id: false, force: :cascade do |t|
    t.integer "f_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.date    "purchase_date"
    t.integer "own_org_id",    limit: 4
    t.string  "duty_person",   limit: 30
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_virtual", id: false, force: :cascade do |t|
    t.integer  "location_id",  limit: 4,                             null: false
    t.integer  "equipment_id", limit: 4,                             null: false
    t.decimal  "qty",                     precision: 33, default: 0, null: false
    t.string   "brand",        limit: 40
    t.string   "model",        limit: 60
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "v_stock_virtual_in", id: false, force: :cascade do |t|
    t.integer "t_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "v_stock_virtual_out", id: false, force: :cascade do |t|
    t.integer "f_location_id", limit: 4,                           null: false
    t.string  "no",            limit: 30
    t.integer "equipment_id",  limit: 4,                           null: false
    t.string  "brand",         limit: 40
    t.string  "model",         limit: 60
    t.decimal "qty",                      precision: 32
    t.decimal "amt",                      precision: 47, scale: 2
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "org_id",          limit: 4,                    null: false
    t.string   "vehicle_no",      limit: 20,                   null: false
    t.string   "model",           limit: 60
    t.string   "register_no",     limit: 30,                   null: false
    t.string   "license_no",      limit: 40,                   null: false
    t.date     "buy_date"
    t.date     "expire_date"
    t.date     "last_check_date"
    t.boolean  "is_active",       limit: 1,     default: true
    t.text     "note",            limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "warehouse_types", force: :cascade do |t|
    t.string   "name",       limit: 30,                null: false
    t.integer  "order_by",   limit: 4,  default: 1
    t.boolean  "is_active",  limit: 1,  default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "code",       limit: 30
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

  create_table "websites", force: :cascade do |t|
    t.string   "name",        limit: 60
    t.string   "home_url",    limit: 255
    t.string   "backend_url", limit: 255
    t.boolean  "is_active",   limit: 1,     default: true
    t.text     "note",        limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "username",    limit: 60
    t.string   "password",    limit: 60
  end

  add_foreign_key "employees", "orgs"
  add_foreign_key "equipment_categories", "orgs"
  add_foreign_key "role_system_function_operates", "roles"
  add_foreign_key "role_system_function_operates", "system_function_operates"
  add_foreign_key "salary_table_lines", "employees"
  add_foreign_key "system_function_operates", "system_functions"
  add_foreign_key "system_functions", "system_function_groups"
  add_foreign_key "user_orgs", "orgs"
  add_foreign_key "user_orgs", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
