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

ActiveRecord::Schema.define(version: 20170510061130) do

  create_table "ap_wfapproval_histories", id: false, force: :cascade do |t|
    t.integer  "invoice_id",            limit: 4
    t.integer  "line_number",           limit: 4
    t.string   "response",              limit: 255
    t.integer  "person_id",             limit: 4
    t.string   "approver_name",         limit: 255
    t.decimal  "amount_approved",                   precision: 15, scale: 2
    t.string   "approver_comments",     limit: 255
    t.date     "last_update_date"
    t.string   "response_dsp",          limit: 255
    t.integer  "iteration",             limit: 4
    t.string   "approval_context",      limit: 255
    t.string   "approval_context_dsp",  limit: 255
    t.integer  "approver_order_number", limit: 4
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "cux_ap_invoice_lines_a", force: :cascade do |t|
    t.integer  "org_id",                limit: 4
    t.integer  "invoice_id",            limit: 4
    t.integer  "line_number",           limit: 4
    t.string   "line_type_lookup_code", limit: 255
    t.string   "line_type",             limit: 255
    t.string   "description",           limit: 255
    t.integer  "default_dist_ccid",     limit: 4
    t.string   "default_dist_cccode",   limit: 255
    t.string   "default_dist_ccdesc",   limit: 255
    t.integer  "po_header_id",          limit: 4
    t.string   "po_seg",                limit: 255
    t.decimal  "quantity_invoiced",                 precision: 15, scale: 2
    t.string   "unit_meas_lookup_code", limit: 255
    t.decimal  "unit_price",                        precision: 15, scale: 2
    t.decimal  "amount",                            precision: 15, scale: 2
    t.date     "creation_date"
    t.date     "last_update_date"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "cux_ap_invoices_a", force: :cascade do |t|
    t.integer  "org_id",                        limit: 4
    t.string   "invoice_type_lookup_code",      limit: 255
    t.string   "invoice_type",                  limit: 255
    t.integer  "vendor_id",                     limit: 4
    t.string   "vendor_name",                   limit: 255
    t.integer  "vendor_site_id",                limit: 4
    t.string   "vendor_site_code",              limit: 255
    t.string   "invoice_num",                   limit: 255
    t.date     "invoice_date"
    t.date     "gl_date"
    t.decimal  "invoice_amount",                            precision: 15, scale: 2
    t.string   "description",                   limit: 255
    t.integer  "accts_pay_code_combination_id", limit: 4
    t.string   "accts_pay_code_seg",            limit: 255
    t.string   "accts_pay_code_desc",           limit: 255
    t.string   "attribute2",                    limit: 255
    t.string   "attribute3",                    limit: 255
    t.string   "attribute3_dsp",                limit: 255
    t.string   "attribute4",                    limit: 255
    t.string   "attribute4_dsp",                limit: 255
    t.string   "attribute7",                    limit: 255
    t.string   "attribute8",                    limit: 255
    t.string   "attribute9",                    limit: 255
    t.string   "attribute10",                   limit: 255
    t.string   "attribute11",                   limit: 255
    t.string   "attribute12",                   limit: 255
    t.string   "attribute13",                   limit: 255
    t.string   "attribute14",                   limit: 255
    t.string   "attribute15",                   limit: 255
    t.string   "wfapproval_status",             limit: 255
    t.string   "wfapproval_status_dsp",         limit: 255
    t.string   "posting_flag",                  limit: 255
    t.string   "approval_status_lookup_code",   limit: 255
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

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
    t.decimal  "line_bugdet",                 precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  create_table "cux_posa_item_activity_his_a", id: false, force: :cascade do |t|
    t.integer  "submit_by_org_id",     limit: 4
    t.string   "submit_by_org_name",   limit: 60
    t.string   "submit_schedule_type", limit: 60
    t.string   "submit_schedule_yqmj", limit: 60
    t.integer  "submit_org_level",     limit: 4
    t.integer  "submit_from",          limit: 4
    t.text     "response_message",     limit: 65535
    t.datetime "submit_date"
    t.string   "item_type",            limit: 255
    t.string   "item_key",             limit: 60
    t.string   "activity_result_code", limit: 60
    t.string   "result_name",          limit: 60
    t.string   "assigned_user",        limit: 60
    t.string   "full_name",            limit: 60
    t.integer  "notification_id",      limit: 4
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "cux_soa_attached_doc_v", id: false, force: :cascade do |t|
    t.integer  "seq_num",              limit: 4
    t.string   "file_name",            limit: 255
    t.string   "category_description", limit: 255
    t.string   "datatype_name",        limit: 255
    t.integer  "datatype_id",          limit: 4
    t.integer  "media_id",             limit: 4
    t.string   "table_name",           limit: 255
    t.string   "pk1_column",           limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "cux_tran_activity_history_a", id: false, force: :cascade do |t|
    t.string   "response_message",     limit: 255
    t.string   "item_type",            limit: 255
    t.string   "item_key",             limit: 255
    t.string   "activity_result_code", limit: 255
    t.string   "result_name",          limit: 255
    t.string   "assigned_user",        limit: 255
    t.string   "full_name",            limit: 255
    t.integer  "notification_id",      limit: 4
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "cux_transaction_headers_all_a", force: :cascade do |t|
    t.string   "require_number",      limit: 255
    t.string   "require_deparment",   limit: 255
    t.string   "require_status",      limit: 255
    t.string   "require_person",      limit: 255
    t.integer  "require_person_id",   limit: 4
    t.datetime "require_date"
    t.datetime "last_update_date"
    t.string   "last_update_by",      limit: 255
    t.datetime "creation_date"
    t.integer  "created_by",          limit: 4
    t.integer  "last_update_login",   limit: 4
    t.string   "require_status_code", limit: 255
    t.string   "require_type",        limit: 255
    t.integer  "require_type_id",     limit: 4
    t.integer  "wip_entity_id",       limit: 4
    t.string   "categorie",           limit: 255
    t.text     "remark",              limit: 65535
    t.string   "trans_deparment",     limit: 255
    t.string   "wf_itemkey",          limit: 255
    t.decimal  "bugdet_balance",                    precision: 15, scale: 2
    t.decimal  "header_bugdet",                     precision: 15, scale: 2
    t.decimal  "bugdet_demand_total",               precision: 15, scale: 2
    t.decimal  "bugdet_total",                      precision: 15, scale: 2
    t.integer  "project_id",          limit: 4
    t.string   "name",                limit: 255
    t.string   "segment1",            limit: 255
    t.string   "project_type",        limit: 255
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "business_type",       limit: 60
  end

  create_table "cux_transaction_lines_all_a", force: :cascade do |t|
    t.integer  "require_id",        limit: 4
    t.integer  "line_number",       limit: 4
    t.integer  "organization_id",   limit: 4
    t.integer  "inventory_item_id", limit: 4
    t.string   "item_spc",          limit: 255
    t.string   "uom",               limit: 255
    t.string   "subinventory",      limit: 255
    t.decimal  "required_qty",                  precision: 15, scale: 2
    t.string   "project_number",    limit: 255
    t.string   "task_number",       limit: 255
    t.string   "apply_number",      limit: 255
    t.integer  "apply_line_num",    limit: 4
    t.decimal  "apply_qty",                     precision: 15, scale: 2
    t.string   "item_number",       limit: 255
    t.string   "item_dec",          limit: 255
    t.string   "remark",            limit: 255
    t.integer  "project_id",        limit: 4
    t.integer  "task_id",           limit: 4
    t.string   "expense_type",      limit: 255
    t.decimal  "cost",                          precision: 15, scale: 2
    t.string   "wip_entity_name",   limit: 255
    t.integer  "operation_seq_num", limit: 4
    t.decimal  "canceled_qty",                  precision: 15, scale: 2
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  create_table "fnd_documents_long_text", id: false, force: :cascade do |t|
    t.integer  "media_id",           limit: 4
    t.string   "app_source_version", limit: 255
    t.text     "long_text",          limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "fnd_documents_short_text", id: false, force: :cascade do |t|
    t.integer  "media_id",           limit: 4
    t.text     "short_text",         limit: 65535
    t.string   "app_source_version", limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "fnd_lob", primary_key: "file_id", force: :cascade do |t|
    t.string   "file_name",         limit: 255
    t.string   "file_content_type", limit: 255
    t.text     "file_data",         limit: 4294967295
    t.datetime "upload_date"
    t.datetime "expiration_date"
    t.string   "program_name",      limit: 255
    t.string   "program_tag",       limit: 255
    t.string   "language",          limit: 255
    t.string   "oracle_charset",    limit: 255
    t.string   "file_format",       limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "maximo_msgs", force: :cascade do |t|
    t.integer  "order_id",      limit: 4
    t.string   "ordersource",   limit: 255
    t.string   "ordercode",     limit: 255
    t.string   "ordertypename", limit: 255
    t.string   "ordertype",     limit: 255
    t.string   "ordertaskname", limit: 255
    t.integer  "ordertaskid",   limit: 4
    t.string   "ordertitle",    limit: 255
    t.integer  "orderuserid",   limit: 4
    t.string   "orderusername", limit: 255
    t.datetime "ordertime"
    t.string   "url",           limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  create_table "users_logins", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "username",   limit: 60
    t.datetime "login_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

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
