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

ActiveRecord::Schema.define(version: 0) do

# Could not dump table "a1" because of following StandardError
#   Unknown type 'ROWID' for column 'row_id'

  create_table "adx_pre_autoconfig", id: false, force: :cascade do |t|
    t.integer "application_id",      limit: nil
    t.string  "profile_option_name", limit: 100
    t.integer "level_id",            limit: nil
    t.decimal "level_value"
    t.string  "profile_value",       limit: 300
    t.integer "level_value_app_id",  limit: nil
    t.string  "context_name",        limit: 100
    t.string  "update_only",         limit: 1
    t.string  "insert_only",         limit: 1
  end

  create_table "ams_infmet_lead_gt", temporary: true, id: false, force: :cascade do |t|
    t.integer  "primary_party_id",     limit: nil
    t.integer  "contact_rel_party_id", limit: nil
    t.datetime "last_activation_date"
    t.integer  "activity_metric_id",   limit: nil
    t.string   "source_category",      limit: 3
    t.integer  "object_id",            limit: nil
  end

  create_table "ams_infmet_order_gt", temporary: true, id: false, force: :cascade do |t|
    t.integer  "primary_party_id",     limit: nil
    t.integer  "contact_rel_party_id", limit: nil
    t.datetime "last_activation_date"
    t.integer  "activity_metric_id",   limit: nil
    t.string   "source_category",      limit: 3
    t.integer  "object_id",            limit: nil
  end

  create_table "ams_infmet_resp_gt", temporary: true, id: false, force: :cascade do |t|
    t.integer  "primary_party_id",     limit: nil
    t.integer  "contact_rel_party_id", limit: nil
    t.datetime "last_activation_date"
    t.integer  "activity_metric_id",   limit: nil
    t.string   "source_category",      limit: 3
  end

  create_table "amv_temp_ids", temporary: true, id: false, force: :cascade do |t|
    t.integer "id",                limit: nil
    t.decimal "number_value"
    t.decimal "score"
    t.string  "obj_code",          limit: 30
    t.integer "security_group_id", limit: nil
  end

  create_table "amv_temp_numbers", temporary: true, id: false, force: :cascade do |t|
    t.decimal "number_value"
    t.integer "security_group_id", limit: nil
  end

  create_table "ap_6050423_emp_vendor_temp", id: false, force: :cascade do |t|
    t.integer  "vendor_id",     limit: nil,               null: false
    t.string   "vendor_num",    limit: 30,                null: false
    t.string   "vendor_name",   limit: 240,               null: false
    t.integer  "person_id",     limit: nil,               null: false
    t.string   "employee_num",  limit: 30
    t.string   "employee_name", limit: 240
    t.datetime "creation_date",                           null: false
    t.string   "process_flag",  limit: 1,   default: "Y"
  end

  create_table "ap_checks_all170504", id: false, force: :cascade do |t|
    t.decimal  "amount",                                                     null: false
    t.integer  "bank_account_id",                limit: nil
    t.string   "bank_account_name",              limit: 80,                  null: false
    t.datetime "check_date",                                                 null: false
    t.integer  "check_id",                       limit: nil,                 null: false
    t.integer  "check_number",                   limit: 15,   precision: 15, null: false
    t.string   "currency_code",                  limit: 15,                  null: false
    t.integer  "last_updated_by",                limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                           null: false
    t.string   "payment_method_lookup_code",     limit: 25
    t.string   "payment_type_flag",              limit: 25,                  null: false
    t.string   "address_line1",                  limit: 240
    t.string   "address_line2",                  limit: 240
    t.string   "address_line3",                  limit: 240
    t.string   "checkrun_name"
    t.integer  "check_format_id",                limit: nil
    t.integer  "check_stock_id",                 limit: nil
    t.string   "city",                           limit: 60
    t.string   "country",                        limit: 60
    t.integer  "created_by",                     limit: 15,   precision: 15
    t.datetime "creation_date"
    t.integer  "last_update_login",              limit: 15,   precision: 15
    t.string   "status_lookup_code",             limit: 25
    t.string   "vendor_name",                    limit: 240
    t.string   "vendor_site_code",               limit: 15
    t.string   "zip",                            limit: 60
    t.string   "bank_account_num",               limit: 30
    t.string   "bank_account_type",              limit: 25
    t.string   "bank_num",                       limit: 30
    t.integer  "check_voucher_num",              limit: 16,   precision: 16
    t.decimal  "cleared_amount"
    t.datetime "cleared_date"
    t.string   "doc_category_code",              limit: 30
    t.integer  "doc_sequence_id",                limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "province",                       limit: 150
    t.string   "released_at",                    limit: 18
    t.integer  "released_by",                    limit: 15,   precision: 15
    t.string   "state",                          limit: 150
    t.string   "stopped_at",                     limit: 18
    t.integer  "stopped_by",                     limit: 15,   precision: 15
    t.datetime "void_date"
    t.string   "attribute1",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute_category",             limit: 150
    t.datetime "future_pay_due_date"
    t.datetime "treasury_pay_date"
    t.integer  "treasury_pay_number",            limit: 15,   precision: 15
    t.string   "ussgl_transaction_code",         limit: 30
    t.string   "ussgl_trx_code_context",         limit: 30
    t.string   "withholding_status_lookup_code", limit: 25
    t.integer  "reconciliation_batch_id",        limit: nil
    t.decimal  "cleared_base_amount"
    t.decimal  "cleared_exchange_rate"
    t.datetime "cleared_exchange_date"
    t.string   "cleared_exchange_rate_type",     limit: 30
    t.string   "address_line4",                  limit: 240
    t.string   "county",                         limit: 150
    t.string   "address_style",                  limit: 30
    t.integer  "org_id",                         limit: nil
    t.integer  "vendor_id",                      limit: nil
    t.integer  "vendor_site_id",                 limit: nil
    t.decimal  "exchange_rate"
    t.datetime "exchange_date"
    t.string   "exchange_rate_type",             limit: 30
    t.decimal  "base_amount"
    t.integer  "checkrun_id",                    limit: nil
    t.integer  "request_id",                     limit: nil
    t.decimal  "cleared_error_amount"
    t.decimal  "cleared_charges_amount"
    t.decimal  "cleared_error_base_amount"
    t.decimal  "cleared_charges_base_amount"
    t.string   "positive_pay_status_code",       limit: 25
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.string   "transfer_priority",              limit: 25
    t.integer  "external_bank_account_id",       limit: nil
    t.decimal  "stamp_duty_amt"
    t.decimal  "stamp_duty_base_amt"
    t.string   "mrc_cleared_base_amount",        limit: 2000
    t.string   "mrc_cleared_exchange_rate",      limit: 2000
    t.string   "mrc_cleared_exchange_date",      limit: 2000
    t.string   "mrc_cleared_exchange_rate_type", limit: 2000
    t.string   "mrc_exchange_rate",              limit: 2000
    t.string   "mrc_exchange_date",              limit: 2000
    t.string   "mrc_exchange_rate_type",         limit: 2000
    t.string   "mrc_base_amount",                limit: 2000
    t.string   "mrc_cleared_error_base_amount",  limit: 2000
    t.string   "mrc_cleared_charges_base_amt",   limit: 2000
    t.string   "mrc_stamp_duty_base_amt",        limit: 2000
    t.datetime "maturity_exchange_date"
    t.string   "maturity_exchange_rate_type",    limit: 30
    t.decimal  "maturity_exchange_rate"
    t.string   "description",                    limit: 240
    t.datetime "actual_value_date"
    t.datetime "anticipated_value_date"
    t.datetime "released_date"
    t.datetime "stopped_date"
    t.string   "mrc_maturity_exg_date",          limit: 2000
    t.string   "mrc_maturity_exg_rate",          limit: 2000
    t.string   "mrc_maturity_exg_rate_type",     limit: 2000
    t.string   "iban_number",                    limit: 40
    t.integer  "ce_bank_acct_use_id",            limit: nil
    t.string   "payment_method_code",            limit: 30
    t.integer  "party_id",                       limit: nil
    t.integer  "party_site_id",                  limit: nil
    t.integer  "payment_profile_id",             limit: nil
    t.string   "settlement_priority",            limit: 30
    t.string   "bank_charge_bearer",             limit: 30
    t.integer  "legal_entity_id",                limit: nil
    t.integer  "payment_document_id",            limit: nil
    t.integer  "completed_pmts_group_id",        limit: nil
    t.integer  "payment_id",                     limit: nil
    t.integer  "payment_instruction_id",         limit: nil
    t.integer  "void_check_number",              limit: 15,   precision: 15
    t.integer  "void_check_id",                  limit: nil
    t.string   "remit_to_supplier_name",         limit: 240
    t.integer  "remit_to_supplier_id",           limit: nil
    t.string   "remit_to_supplier_site",         limit: 240
    t.integer  "remit_to_supplier_site_id",      limit: nil
    t.integer  "relationship_id",                limit: nil
    t.string   "paycard_authorization_number",   limit: 30
    t.integer  "paycard_reference_id",           limit: nil
  end

  create_table "ap_checks_all20160803", id: false, force: :cascade do |t|
    t.decimal  "amount",                                                     null: false
    t.integer  "bank_account_id",                limit: nil
    t.string   "bank_account_name",              limit: 80,                  null: false
    t.datetime "check_date",                                                 null: false
    t.integer  "check_id",                       limit: nil,                 null: false
    t.integer  "check_number",                   limit: 15,   precision: 15, null: false
    t.string   "currency_code",                  limit: 15,                  null: false
    t.integer  "last_updated_by",                limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                           null: false
    t.string   "payment_method_lookup_code",     limit: 25
    t.string   "payment_type_flag",              limit: 25,                  null: false
    t.string   "address_line1",                  limit: 240
    t.string   "address_line2",                  limit: 240
    t.string   "address_line3",                  limit: 240
    t.string   "checkrun_name"
    t.integer  "check_format_id",                limit: nil
    t.integer  "check_stock_id",                 limit: nil
    t.string   "city",                           limit: 60
    t.string   "country",                        limit: 60
    t.integer  "created_by",                     limit: 15,   precision: 15
    t.datetime "creation_date"
    t.integer  "last_update_login",              limit: 15,   precision: 15
    t.string   "status_lookup_code",             limit: 25
    t.string   "vendor_name",                    limit: 240
    t.string   "vendor_site_code",               limit: 15
    t.string   "zip",                            limit: 60
    t.string   "bank_account_num",               limit: 30
    t.string   "bank_account_type",              limit: 25
    t.string   "bank_num",                       limit: 30
    t.integer  "check_voucher_num",              limit: 16,   precision: 16
    t.decimal  "cleared_amount"
    t.datetime "cleared_date"
    t.string   "doc_category_code",              limit: 30
    t.integer  "doc_sequence_id",                limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "province",                       limit: 150
    t.string   "released_at",                    limit: 18
    t.integer  "released_by",                    limit: 15,   precision: 15
    t.string   "state",                          limit: 150
    t.string   "stopped_at",                     limit: 18
    t.integer  "stopped_by",                     limit: 15,   precision: 15
    t.datetime "void_date"
    t.string   "attribute1",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute_category",             limit: 150
    t.datetime "future_pay_due_date"
    t.datetime "treasury_pay_date"
    t.integer  "treasury_pay_number",            limit: 15,   precision: 15
    t.string   "ussgl_transaction_code",         limit: 30
    t.string   "ussgl_trx_code_context",         limit: 30
    t.string   "withholding_status_lookup_code", limit: 25
    t.integer  "reconciliation_batch_id",        limit: nil
    t.decimal  "cleared_base_amount"
    t.decimal  "cleared_exchange_rate"
    t.datetime "cleared_exchange_date"
    t.string   "cleared_exchange_rate_type",     limit: 30
    t.string   "address_line4",                  limit: 240
    t.string   "county",                         limit: 150
    t.string   "address_style",                  limit: 30
    t.integer  "org_id",                         limit: nil
    t.integer  "vendor_id",                      limit: nil
    t.integer  "vendor_site_id",                 limit: nil
    t.decimal  "exchange_rate"
    t.datetime "exchange_date"
    t.string   "exchange_rate_type",             limit: 30
    t.decimal  "base_amount"
    t.integer  "checkrun_id",                    limit: nil
    t.integer  "request_id",                     limit: nil
    t.decimal  "cleared_error_amount"
    t.decimal  "cleared_charges_amount"
    t.decimal  "cleared_error_base_amount"
    t.decimal  "cleared_charges_base_amount"
    t.string   "positive_pay_status_code",       limit: 25
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.string   "transfer_priority",              limit: 25
    t.integer  "external_bank_account_id",       limit: nil
    t.decimal  "stamp_duty_amt"
    t.decimal  "stamp_duty_base_amt"
    t.string   "mrc_cleared_base_amount",        limit: 2000
    t.string   "mrc_cleared_exchange_rate",      limit: 2000
    t.string   "mrc_cleared_exchange_date",      limit: 2000
    t.string   "mrc_cleared_exchange_rate_type", limit: 2000
    t.string   "mrc_exchange_rate",              limit: 2000
    t.string   "mrc_exchange_date",              limit: 2000
    t.string   "mrc_exchange_rate_type",         limit: 2000
    t.string   "mrc_base_amount",                limit: 2000
    t.string   "mrc_cleared_error_base_amount",  limit: 2000
    t.string   "mrc_cleared_charges_base_amt",   limit: 2000
    t.string   "mrc_stamp_duty_base_amt",        limit: 2000
    t.datetime "maturity_exchange_date"
    t.string   "maturity_exchange_rate_type",    limit: 30
    t.decimal  "maturity_exchange_rate"
    t.string   "description",                    limit: 240
    t.datetime "actual_value_date"
    t.datetime "anticipated_value_date"
    t.datetime "released_date"
    t.datetime "stopped_date"
    t.string   "mrc_maturity_exg_date",          limit: 2000
    t.string   "mrc_maturity_exg_rate",          limit: 2000
    t.string   "mrc_maturity_exg_rate_type",     limit: 2000
    t.string   "iban_number",                    limit: 40
    t.integer  "ce_bank_acct_use_id",            limit: nil
    t.string   "payment_method_code",            limit: 30
    t.integer  "party_id",                       limit: nil
    t.integer  "party_site_id",                  limit: nil
    t.integer  "payment_profile_id",             limit: nil
    t.string   "settlement_priority",            limit: 30
    t.string   "bank_charge_bearer",             limit: 30
    t.integer  "legal_entity_id",                limit: nil
    t.integer  "payment_document_id",            limit: nil
    t.integer  "completed_pmts_group_id",        limit: nil
    t.integer  "payment_id",                     limit: nil
    t.integer  "payment_instruction_id",         limit: nil
    t.integer  "void_check_number",              limit: 15,   precision: 15
    t.integer  "void_check_id",                  limit: nil
    t.string   "remit_to_supplier_name",         limit: 240
    t.integer  "remit_to_supplier_id",           limit: nil
    t.string   "remit_to_supplier_site",         limit: 240
    t.integer  "remit_to_supplier_site_id",      limit: nil
    t.integer  "relationship_id",                limit: nil
    t.string   "paycard_authorization_number",   limit: 30
    t.integer  "paycard_reference_id",           limit: nil
  end

  create_table "ap_holds_all20151102", id: false, force: :cascade do |t|
    t.integer  "invoice_id",          limit: nil,                 null: false
    t.integer  "line_location_id",    limit: nil
    t.string   "hold_lookup_code",    limit: 25,                  null: false
    t.datetime "last_update_date",                                null: false
    t.integer  "last_updated_by",     limit: 15,   precision: 15, null: false
    t.integer  "held_by",             limit: 15,   precision: 15, null: false
    t.datetime "hold_date",                                       null: false
    t.string   "hold_reason",         limit: 240
    t.string   "release_lookup_code", limit: 25
    t.string   "release_reason",      limit: 240
    t.string   "status_flag",         limit: 25
    t.integer  "last_update_login",   limit: 15,   precision: 15
    t.datetime "creation_date"
    t.integer  "created_by",          limit: 15,   precision: 15
    t.string   "attribute_category",  limit: 150
    t.string   "attribute1",          limit: 150
    t.string   "attribute2",          limit: 150
    t.string   "attribute3",          limit: 150
    t.string   "attribute4",          limit: 150
    t.string   "attribute5",          limit: 150
    t.string   "attribute6",          limit: 150
    t.string   "attribute7",          limit: 150
    t.string   "attribute8",          limit: 150
    t.string   "attribute9",          limit: 150
    t.string   "attribute10",         limit: 150
    t.string   "attribute11",         limit: 150
    t.string   "attribute12",         limit: 150
    t.string   "attribute13",         limit: 150
    t.string   "attribute14",         limit: 150
    t.string   "attribute15",         limit: 150
    t.integer  "org_id",              limit: nil
    t.integer  "responsibility_id",   limit: nil
    t.integer  "rcv_transaction_id",  limit: nil
    t.string   "hold_details",        limit: 2000
    t.decimal  "line_number"
    t.integer  "hold_id",             limit: nil,                 null: false
    t.string   "wf_status",           limit: 30
  end

  create_table "ap_holds_all_all20150908", id: false, force: :cascade do |t|
    t.integer  "invoice_id",          limit: nil,                 null: false
    t.integer  "line_location_id",    limit: nil
    t.string   "hold_lookup_code",    limit: 25,                  null: false
    t.datetime "last_update_date",                                null: false
    t.integer  "last_updated_by",     limit: 15,   precision: 15, null: false
    t.integer  "held_by",             limit: 15,   precision: 15, null: false
    t.datetime "hold_date",                                       null: false
    t.string   "hold_reason",         limit: 240
    t.string   "release_lookup_code", limit: 25
    t.string   "release_reason",      limit: 240
    t.string   "status_flag",         limit: 25
    t.integer  "last_update_login",   limit: 15,   precision: 15
    t.datetime "creation_date"
    t.integer  "created_by",          limit: 15,   precision: 15
    t.string   "attribute_category",  limit: 150
    t.string   "attribute1",          limit: 150
    t.string   "attribute2",          limit: 150
    t.string   "attribute3",          limit: 150
    t.string   "attribute4",          limit: 150
    t.string   "attribute5",          limit: 150
    t.string   "attribute6",          limit: 150
    t.string   "attribute7",          limit: 150
    t.string   "attribute8",          limit: 150
    t.string   "attribute9",          limit: 150
    t.string   "attribute10",         limit: 150
    t.string   "attribute11",         limit: 150
    t.string   "attribute12",         limit: 150
    t.string   "attribute13",         limit: 150
    t.string   "attribute14",         limit: 150
    t.string   "attribute15",         limit: 150
    t.integer  "org_id",              limit: nil
    t.integer  "responsibility_id",   limit: nil
    t.integer  "rcv_transaction_id",  limit: nil
    t.string   "hold_details",        limit: 2000
    t.decimal  "line_number"
    t.integer  "hold_id",             limit: nil,                 null: false
    t.string   "wf_status",           limit: 30
  end

  create_table "ap_inv_aprvl_hist_all20141015", id: false, force: :cascade do |t|
    t.integer  "approval_history_id", limit: nil,                null: false
    t.integer  "invoice_id",          limit: nil,                null: false
    t.integer  "iteration",           limit: 9,   precision: 9
    t.string   "response",            limit: 50
    t.integer  "approver_id",         limit: nil
    t.string   "approver_name",       limit: 150
    t.decimal  "amount_approved"
    t.string   "approver_comments",   limit: 240
    t.integer  "created_by",          limit: 15,  precision: 15, null: false
    t.datetime "creation_date",                                  null: false
    t.datetime "last_update_date",                               null: false
    t.integer  "last_updated_by",     limit: 15,  precision: 15, null: false
    t.integer  "last_update_login",   limit: 15,  precision: 15
    t.integer  "org_id",              limit: nil
    t.integer  "notification_order",  limit: 9,   precision: 9
    t.string   "orig_system",         limit: 30
    t.string   "item_class",          limit: 50
    t.string   "item_id",             limit: 50
    t.integer  "line_number",         limit: 15,  precision: 15
    t.integer  "hold_id",             limit: nil
    t.string   "history_type",        limit: 30
  end

  create_table "ap_inv_distributions_20160518", id: false, force: :cascade do |t|
    t.datetime "accounting_date",                                                     null: false
    t.string   "accrual_posted_flag",           limit: 1
    t.string   "assets_addition_flag",          limit: 1,                             null: false
    t.string   "assets_tracking_flag",          limit: 1,                             null: false
    t.string   "cash_posted_flag",              limit: 1
    t.integer  "distribution_line_number",      limit: 15,   precision: 15,           null: false
    t.integer  "dist_code_combination_id",      limit: nil,                           null: false
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.datetime "last_update_date",                                                    null: false
    t.string   "line_type_lookup_code",         limit: 25,                            null: false
    t.string   "period_name",                   limit: 15,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.decimal  "amount"
    t.decimal  "base_amount"
    t.decimal  "base_invoice_price_variance"
    t.integer  "batch_id",                      limit: nil
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.datetime "creation_date"
    t.string   "description",                   limit: 240
    t.decimal  "exchange_rate_variance"
    t.string   "final_match_flag",              limit: 1
    t.string   "income_tax_region",             limit: 10
    t.decimal  "invoice_price_variance"
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "match_status_flag",             limit: 1
    t.string   "posted_flag",                   limit: 1
    t.integer  "po_distribution_id",            limit: nil
    t.integer  "program_application_id",        limit: nil
    t.integer  "program_id",                    limit: nil
    t.datetime "program_update_date"
    t.decimal  "quantity_invoiced"
    t.integer  "rate_var_code_combination_id",  limit: nil
    t.integer  "request_id",                    limit: nil
    t.string   "reversal_flag",                 limit: 1
    t.string   "type_1099",                     limit: 10
    t.decimal  "unit_price"
    t.decimal  "amount_encumbered"
    t.decimal  "base_amount_encumbered"
    t.string   "encumbered_flag",               limit: 1
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.string   "price_adjustment_flag",         limit: 1
    t.integer  "price_var_code_combination_id", limit: nil
    t.decimal  "quantity_unencumbered"
    t.decimal  "stat_amount"
    t.decimal  "amount_to_post"
    t.string   "attribute1",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute_category",            limit: 150
    t.decimal  "base_amount_to_post"
    t.integer  "cash_je_batch_id",              limit: nil
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",   limit: nil
    t.string   "expenditure_type",              limit: 30
    t.integer  "je_batch_id",                   limit: nil
    t.integer  "parent_invoice_id",             limit: nil
    t.string   "pa_addition_flag",              limit: 1
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.decimal  "posted_amount"
    t.decimal  "posted_base_amount"
    t.decimal  "prepay_amount_remaining"
    t.string   "project_accounting_context",    limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.datetime "earliest_settlement_date"
    t.integer  "req_distribution_id",           limit: nil
    t.decimal  "quantity_variance"
    t.decimal  "base_quantity_variance"
    t.integer  "packet_id",                     limit: nil
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.integer  "awt_tax_rate_id",               limit: nil
    t.decimal  "awt_gross_amount"
    t.integer  "awt_invoice_id",                limit: nil
    t.integer  "awt_origin_group_id",           limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.integer  "other_invoice_id",              limit: nil
    t.integer  "awt_invoice_payment_id",        limit: nil
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.integer  "line_group_number",             limit: 15,   precision: 15
    t.string   "receipt_verified_flag",         limit: 1
    t.string   "receipt_required_flag",         limit: 1
    t.string   "receipt_missing_flag",          limit: 1
    t.string   "justification",                 limit: 240
    t.string   "expense_group",                 limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",         limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",              limit: nil
    t.string   "adjustment_reason",             limit: 240
    t.integer  "award_id",                      limit: nil
    t.string   "mrc_accrual_posted_flag",       limit: 2000
    t.string   "mrc_cash_posted_flag",          limit: 2000
    t.string   "mrc_dist_code_combination_id",  limit: 2000
    t.string   "mrc_amount",                    limit: 2000
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_base_inv_price_variance",   limit: 2000
    t.string   "mrc_exchange_rate_variance",    limit: 2000
    t.string   "mrc_posted_flag",               limit: 2000
    t.string   "mrc_program_application_id",    limit: 2000
    t.string   "mrc_program_id",                limit: 2000
    t.string   "mrc_program_update_date",       limit: 2000
    t.string   "mrc_rate_var_ccid",             limit: 2000
    t.string   "mrc_request_id",                limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_amount_to_post",            limit: 2000
    t.string   "mrc_base_amount_to_post",       limit: 2000
    t.string   "mrc_cash_je_batch_id",          limit: 2000
    t.string   "mrc_je_batch_id",               limit: 2000
    t.string   "mrc_posted_amount",             limit: 2000
    t.string   "mrc_posted_base_amount",        limit: 2000
    t.string   "mrc_receipt_conversion_rate",   limit: 2000
    t.integer  "credit_card_trx_id",            limit: nil
    t.string   "dist_match_type",               limit: 25
    t.integer  "rcv_transaction_id",            limit: nil
    t.integer  "invoice_distribution_id",       limit: nil,                           null: false
    t.integer  "parent_reversal_id",            limit: nil
    t.string   "tax_recoverable_flag",          limit: 1
    t.integer  "pa_cc_ar_invoice_id",           limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",     limit: 15,   precision: 15
    t.string   "pa_cc_processed_code",          limit: 1
    t.string   "merchant_document_number",      limit: 80
    t.string   "merchant_name",                 limit: 80
    t.string   "merchant_reference",            limit: 240
    t.string   "merchant_tax_reg_number",       limit: 80
    t.string   "merchant_taxpayer_id",          limit: 80
    t.string   "country_of_supply",             limit: 5
    t.string   "matched_uom_lookup_code",       limit: 25
    t.decimal  "gms_burdenable_raw_cost",                    precision: 22, scale: 5
    t.integer  "accounting_event_id",           limit: nil
    t.integer  "prepay_distribution_id",        limit: nil
    t.decimal  "upgrade_posted_amt"
    t.decimal  "upgrade_base_posted_amt"
    t.string   "inventory_transfer_status",     limit: 1
    t.integer  "company_prepaid_invoice_id",    limit: nil
    t.string   "cc_reversal_flag",              limit: 1
    t.decimal  "awt_withheld_amt"
    t.string   "invoice_includes_prepay_flag",  limit: 1
    t.integer  "price_correct_inv_id",          limit: nil
    t.decimal  "price_correct_qty"
    t.string   "pa_cmt_xface_flag",             limit: 1
    t.string   "cancellation_flag",             limit: 1
    t.decimal  "invoice_line_number"
    t.integer  "corrected_invoice_dist_id",     limit: nil
    t.decimal  "rounding_amt"
    t.integer  "charge_applicable_to_dist_id",  limit: nil
    t.decimal  "corrected_quantity"
    t.integer  "related_id",                    limit: nil
    t.string   "asset_book_type_code",          limit: 15
    t.integer  "asset_category_id",             limit: nil
    t.string   "distribution_class",            limit: 30
    t.decimal  "final_payment_rounding"
    t.decimal  "final_application_rounding"
    t.decimal  "amount_at_prepay_xrate"
    t.decimal  "cash_basis_final_app_rounding"
    t.decimal  "amount_at_prepay_pay_xrate"
    t.string   "intended_use",                  limit: 30
    t.integer  "detail_tax_dist_id",            limit: nil
    t.decimal  "rec_nrec_rate"
    t.integer  "recovery_rate_id",              limit: nil
    t.string   "recovery_rate_name",            limit: 150
    t.string   "recovery_type_code",            limit: 30
    t.string   "recovery_rate_code",            limit: 30
    t.integer  "withholding_tax_code_id",       limit: nil
    t.string   "tax_already_distributed_flag",  limit: 1
    t.integer  "summary_tax_line_id",           limit: nil
    t.decimal  "taxable_amount"
    t.decimal  "taxable_base_amount"
    t.decimal  "extra_po_erv"
    t.decimal  "prepay_tax_diff_amount"
    t.integer  "tax_code_id",                   limit: nil
    t.string   "vat_code",                      limit: 15
    t.string   "amount_includes_tax_flag",      limit: 1
    t.string   "tax_calculated_flag",           limit: 1
    t.decimal  "tax_recovery_rate"
    t.string   "tax_recovery_override_flag",    limit: 1
    t.string   "tax_code_override_flag",        limit: 1
    t.decimal  "total_dist_amount"
    t.decimal  "total_dist_base_amount"
    t.integer  "prepay_tax_parent_id",          limit: nil
    t.string   "cancelled_flag",                limit: 1
    t.integer  "old_distribution_id",           limit: nil
    t.integer  "old_dist_line_number",          limit: 15,   precision: 15
    t.decimal  "amount_variance"
    t.decimal  "base_amount_variance"
    t.string   "historical_flag",               limit: 1
    t.string   "rcv_charge_addition_flag",      limit: 1
    t.integer  "awt_related_id",                limit: nil
    t.integer  "related_retainage_dist_id",     limit: nil
    t.decimal  "retained_amount_remaining"
    t.integer  "bc_event_id",                   limit: nil
    t.integer  "retained_invoice_dist_id",      limit: nil
    t.decimal  "final_release_rounding"
    t.string   "fully_paid_acctd_flag",         limit: 1
    t.integer  "root_distribution_id",          limit: nil
    t.integer  "xinv_parent_reversal_id",       limit: nil
    t.integer  "recurring_payment_id",          limit: nil
    t.integer  "release_inv_dist_derived_from", limit: 15,   precision: 15
    t.integer  "pay_awt_group_id",              limit: nil
  end

  create_table "ap_inv_distributions_20160520", id: false, force: :cascade do |t|
    t.datetime "accounting_date",                                                     null: false
    t.string   "accrual_posted_flag",           limit: 1
    t.string   "assets_addition_flag",          limit: 1,                             null: false
    t.string   "assets_tracking_flag",          limit: 1,                             null: false
    t.string   "cash_posted_flag",              limit: 1
    t.integer  "distribution_line_number",      limit: 15,   precision: 15,           null: false
    t.integer  "dist_code_combination_id",      limit: nil,                           null: false
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.datetime "last_update_date",                                                    null: false
    t.string   "line_type_lookup_code",         limit: 25,                            null: false
    t.string   "period_name",                   limit: 15,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.decimal  "amount"
    t.decimal  "base_amount"
    t.decimal  "base_invoice_price_variance"
    t.integer  "batch_id",                      limit: nil
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.datetime "creation_date"
    t.string   "description",                   limit: 240
    t.decimal  "exchange_rate_variance"
    t.string   "final_match_flag",              limit: 1
    t.string   "income_tax_region",             limit: 10
    t.decimal  "invoice_price_variance"
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "match_status_flag",             limit: 1
    t.string   "posted_flag",                   limit: 1
    t.integer  "po_distribution_id",            limit: nil
    t.integer  "program_application_id",        limit: nil
    t.integer  "program_id",                    limit: nil
    t.datetime "program_update_date"
    t.decimal  "quantity_invoiced"
    t.integer  "rate_var_code_combination_id",  limit: nil
    t.integer  "request_id",                    limit: nil
    t.string   "reversal_flag",                 limit: 1
    t.string   "type_1099",                     limit: 10
    t.decimal  "unit_price"
    t.decimal  "amount_encumbered"
    t.decimal  "base_amount_encumbered"
    t.string   "encumbered_flag",               limit: 1
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.string   "price_adjustment_flag",         limit: 1
    t.integer  "price_var_code_combination_id", limit: nil
    t.decimal  "quantity_unencumbered"
    t.decimal  "stat_amount"
    t.decimal  "amount_to_post"
    t.string   "attribute1",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute_category",            limit: 150
    t.decimal  "base_amount_to_post"
    t.integer  "cash_je_batch_id",              limit: nil
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",   limit: nil
    t.string   "expenditure_type",              limit: 30
    t.integer  "je_batch_id",                   limit: nil
    t.integer  "parent_invoice_id",             limit: nil
    t.string   "pa_addition_flag",              limit: 1
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.decimal  "posted_amount"
    t.decimal  "posted_base_amount"
    t.decimal  "prepay_amount_remaining"
    t.string   "project_accounting_context",    limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.datetime "earliest_settlement_date"
    t.integer  "req_distribution_id",           limit: nil
    t.decimal  "quantity_variance"
    t.decimal  "base_quantity_variance"
    t.integer  "packet_id",                     limit: nil
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.integer  "awt_tax_rate_id",               limit: nil
    t.decimal  "awt_gross_amount"
    t.integer  "awt_invoice_id",                limit: nil
    t.integer  "awt_origin_group_id",           limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.integer  "other_invoice_id",              limit: nil
    t.integer  "awt_invoice_payment_id",        limit: nil
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.integer  "line_group_number",             limit: 15,   precision: 15
    t.string   "receipt_verified_flag",         limit: 1
    t.string   "receipt_required_flag",         limit: 1
    t.string   "receipt_missing_flag",          limit: 1
    t.string   "justification",                 limit: 240
    t.string   "expense_group",                 limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",         limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",              limit: nil
    t.string   "adjustment_reason",             limit: 240
    t.integer  "award_id",                      limit: nil
    t.string   "mrc_accrual_posted_flag",       limit: 2000
    t.string   "mrc_cash_posted_flag",          limit: 2000
    t.string   "mrc_dist_code_combination_id",  limit: 2000
    t.string   "mrc_amount",                    limit: 2000
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_base_inv_price_variance",   limit: 2000
    t.string   "mrc_exchange_rate_variance",    limit: 2000
    t.string   "mrc_posted_flag",               limit: 2000
    t.string   "mrc_program_application_id",    limit: 2000
    t.string   "mrc_program_id",                limit: 2000
    t.string   "mrc_program_update_date",       limit: 2000
    t.string   "mrc_rate_var_ccid",             limit: 2000
    t.string   "mrc_request_id",                limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_amount_to_post",            limit: 2000
    t.string   "mrc_base_amount_to_post",       limit: 2000
    t.string   "mrc_cash_je_batch_id",          limit: 2000
    t.string   "mrc_je_batch_id",               limit: 2000
    t.string   "mrc_posted_amount",             limit: 2000
    t.string   "mrc_posted_base_amount",        limit: 2000
    t.string   "mrc_receipt_conversion_rate",   limit: 2000
    t.integer  "credit_card_trx_id",            limit: nil
    t.string   "dist_match_type",               limit: 25
    t.integer  "rcv_transaction_id",            limit: nil
    t.integer  "invoice_distribution_id",       limit: nil,                           null: false
    t.integer  "parent_reversal_id",            limit: nil
    t.string   "tax_recoverable_flag",          limit: 1
    t.integer  "pa_cc_ar_invoice_id",           limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",     limit: 15,   precision: 15
    t.string   "pa_cc_processed_code",          limit: 1
    t.string   "merchant_document_number",      limit: 80
    t.string   "merchant_name",                 limit: 80
    t.string   "merchant_reference",            limit: 240
    t.string   "merchant_tax_reg_number",       limit: 80
    t.string   "merchant_taxpayer_id",          limit: 80
    t.string   "country_of_supply",             limit: 5
    t.string   "matched_uom_lookup_code",       limit: 25
    t.decimal  "gms_burdenable_raw_cost",                    precision: 22, scale: 5
    t.integer  "accounting_event_id",           limit: nil
    t.integer  "prepay_distribution_id",        limit: nil
    t.decimal  "upgrade_posted_amt"
    t.decimal  "upgrade_base_posted_amt"
    t.string   "inventory_transfer_status",     limit: 1
    t.integer  "company_prepaid_invoice_id",    limit: nil
    t.string   "cc_reversal_flag",              limit: 1
    t.decimal  "awt_withheld_amt"
    t.string   "invoice_includes_prepay_flag",  limit: 1
    t.integer  "price_correct_inv_id",          limit: nil
    t.decimal  "price_correct_qty"
    t.string   "pa_cmt_xface_flag",             limit: 1
    t.string   "cancellation_flag",             limit: 1
    t.decimal  "invoice_line_number"
    t.integer  "corrected_invoice_dist_id",     limit: nil
    t.decimal  "rounding_amt"
    t.integer  "charge_applicable_to_dist_id",  limit: nil
    t.decimal  "corrected_quantity"
    t.integer  "related_id",                    limit: nil
    t.string   "asset_book_type_code",          limit: 15
    t.integer  "asset_category_id",             limit: nil
    t.string   "distribution_class",            limit: 30
    t.decimal  "final_payment_rounding"
    t.decimal  "final_application_rounding"
    t.decimal  "amount_at_prepay_xrate"
    t.decimal  "cash_basis_final_app_rounding"
    t.decimal  "amount_at_prepay_pay_xrate"
    t.string   "intended_use",                  limit: 30
    t.integer  "detail_tax_dist_id",            limit: nil
    t.decimal  "rec_nrec_rate"
    t.integer  "recovery_rate_id",              limit: nil
    t.string   "recovery_rate_name",            limit: 150
    t.string   "recovery_type_code",            limit: 30
    t.string   "recovery_rate_code",            limit: 30
    t.integer  "withholding_tax_code_id",       limit: nil
    t.string   "tax_already_distributed_flag",  limit: 1
    t.integer  "summary_tax_line_id",           limit: nil
    t.decimal  "taxable_amount"
    t.decimal  "taxable_base_amount"
    t.decimal  "extra_po_erv"
    t.decimal  "prepay_tax_diff_amount"
    t.integer  "tax_code_id",                   limit: nil
    t.string   "vat_code",                      limit: 15
    t.string   "amount_includes_tax_flag",      limit: 1
    t.string   "tax_calculated_flag",           limit: 1
    t.decimal  "tax_recovery_rate"
    t.string   "tax_recovery_override_flag",    limit: 1
    t.string   "tax_code_override_flag",        limit: 1
    t.decimal  "total_dist_amount"
    t.decimal  "total_dist_base_amount"
    t.integer  "prepay_tax_parent_id",          limit: nil
    t.string   "cancelled_flag",                limit: 1
    t.integer  "old_distribution_id",           limit: nil
    t.integer  "old_dist_line_number",          limit: 15,   precision: 15
    t.decimal  "amount_variance"
    t.decimal  "base_amount_variance"
    t.string   "historical_flag",               limit: 1
    t.string   "rcv_charge_addition_flag",      limit: 1
    t.integer  "awt_related_id",                limit: nil
    t.integer  "related_retainage_dist_id",     limit: nil
    t.decimal  "retained_amount_remaining"
    t.integer  "bc_event_id",                   limit: nil
    t.integer  "retained_invoice_dist_id",      limit: nil
    t.decimal  "final_release_rounding"
    t.string   "fully_paid_acctd_flag",         limit: 1
    t.integer  "root_distribution_id",          limit: nil
    t.integer  "xinv_parent_reversal_id",       limit: nil
    t.integer  "recurring_payment_id",          limit: nil
    t.integer  "release_inv_dist_derived_from", limit: 15,   precision: 15
    t.integer  "pay_awt_group_id",              limit: nil
  end

  create_table "ap_invoice_dist20150908", id: false, force: :cascade do |t|
    t.datetime "accounting_date",                                                     null: false
    t.string   "accrual_posted_flag",           limit: 1
    t.string   "assets_addition_flag",          limit: 1,                             null: false
    t.string   "assets_tracking_flag",          limit: 1,                             null: false
    t.string   "cash_posted_flag",              limit: 1
    t.integer  "distribution_line_number",      limit: 15,   precision: 15,           null: false
    t.integer  "dist_code_combination_id",      limit: nil,                           null: false
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.datetime "last_update_date",                                                    null: false
    t.string   "line_type_lookup_code",         limit: 25,                            null: false
    t.string   "period_name",                   limit: 15,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.decimal  "amount"
    t.decimal  "base_amount"
    t.decimal  "base_invoice_price_variance"
    t.integer  "batch_id",                      limit: nil
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.datetime "creation_date"
    t.string   "description",                   limit: 240
    t.decimal  "exchange_rate_variance"
    t.string   "final_match_flag",              limit: 1
    t.string   "income_tax_region",             limit: 10
    t.decimal  "invoice_price_variance"
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "match_status_flag",             limit: 1
    t.string   "posted_flag",                   limit: 1
    t.integer  "po_distribution_id",            limit: nil
    t.integer  "program_application_id",        limit: nil
    t.integer  "program_id",                    limit: nil
    t.datetime "program_update_date"
    t.decimal  "quantity_invoiced"
    t.integer  "rate_var_code_combination_id",  limit: nil
    t.integer  "request_id",                    limit: nil
    t.string   "reversal_flag",                 limit: 1
    t.string   "type_1099",                     limit: 10
    t.decimal  "unit_price"
    t.decimal  "amount_encumbered"
    t.decimal  "base_amount_encumbered"
    t.string   "encumbered_flag",               limit: 1
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.string   "price_adjustment_flag",         limit: 1
    t.integer  "price_var_code_combination_id", limit: nil
    t.decimal  "quantity_unencumbered"
    t.decimal  "stat_amount"
    t.decimal  "amount_to_post"
    t.string   "attribute1",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute_category",            limit: 150
    t.decimal  "base_amount_to_post"
    t.integer  "cash_je_batch_id",              limit: nil
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",   limit: nil
    t.string   "expenditure_type",              limit: 30
    t.integer  "je_batch_id",                   limit: nil
    t.integer  "parent_invoice_id",             limit: nil
    t.string   "pa_addition_flag",              limit: 1
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.decimal  "posted_amount"
    t.decimal  "posted_base_amount"
    t.decimal  "prepay_amount_remaining"
    t.string   "project_accounting_context",    limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.datetime "earliest_settlement_date"
    t.integer  "req_distribution_id",           limit: nil
    t.decimal  "quantity_variance"
    t.decimal  "base_quantity_variance"
    t.integer  "packet_id",                     limit: nil
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.integer  "awt_tax_rate_id",               limit: nil
    t.decimal  "awt_gross_amount"
    t.integer  "awt_invoice_id",                limit: nil
    t.integer  "awt_origin_group_id",           limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.integer  "other_invoice_id",              limit: nil
    t.integer  "awt_invoice_payment_id",        limit: nil
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.integer  "line_group_number",             limit: 15,   precision: 15
    t.string   "receipt_verified_flag",         limit: 1
    t.string   "receipt_required_flag",         limit: 1
    t.string   "receipt_missing_flag",          limit: 1
    t.string   "justification",                 limit: 240
    t.string   "expense_group",                 limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",         limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",              limit: nil
    t.string   "adjustment_reason",             limit: 240
    t.integer  "award_id",                      limit: nil
    t.string   "mrc_accrual_posted_flag",       limit: 2000
    t.string   "mrc_cash_posted_flag",          limit: 2000
    t.string   "mrc_dist_code_combination_id",  limit: 2000
    t.string   "mrc_amount",                    limit: 2000
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_base_inv_price_variance",   limit: 2000
    t.string   "mrc_exchange_rate_variance",    limit: 2000
    t.string   "mrc_posted_flag",               limit: 2000
    t.string   "mrc_program_application_id",    limit: 2000
    t.string   "mrc_program_id",                limit: 2000
    t.string   "mrc_program_update_date",       limit: 2000
    t.string   "mrc_rate_var_ccid",             limit: 2000
    t.string   "mrc_request_id",                limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_amount_to_post",            limit: 2000
    t.string   "mrc_base_amount_to_post",       limit: 2000
    t.string   "mrc_cash_je_batch_id",          limit: 2000
    t.string   "mrc_je_batch_id",               limit: 2000
    t.string   "mrc_posted_amount",             limit: 2000
    t.string   "mrc_posted_base_amount",        limit: 2000
    t.string   "mrc_receipt_conversion_rate",   limit: 2000
    t.integer  "credit_card_trx_id",            limit: nil
    t.string   "dist_match_type",               limit: 25
    t.integer  "rcv_transaction_id",            limit: nil
    t.integer  "invoice_distribution_id",       limit: nil,                           null: false
    t.integer  "parent_reversal_id",            limit: nil
    t.string   "tax_recoverable_flag",          limit: 1
    t.integer  "pa_cc_ar_invoice_id",           limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",     limit: 15,   precision: 15
    t.string   "pa_cc_processed_code",          limit: 1
    t.string   "merchant_document_number",      limit: 80
    t.string   "merchant_name",                 limit: 80
    t.string   "merchant_reference",            limit: 240
    t.string   "merchant_tax_reg_number",       limit: 80
    t.string   "merchant_taxpayer_id",          limit: 80
    t.string   "country_of_supply",             limit: 5
    t.string   "matched_uom_lookup_code",       limit: 25
    t.decimal  "gms_burdenable_raw_cost",                    precision: 22, scale: 5
    t.integer  "accounting_event_id",           limit: nil
    t.integer  "prepay_distribution_id",        limit: nil
    t.decimal  "upgrade_posted_amt"
    t.decimal  "upgrade_base_posted_amt"
    t.string   "inventory_transfer_status",     limit: 1
    t.integer  "company_prepaid_invoice_id",    limit: nil
    t.string   "cc_reversal_flag",              limit: 1
    t.decimal  "awt_withheld_amt"
    t.string   "invoice_includes_prepay_flag",  limit: 1
    t.integer  "price_correct_inv_id",          limit: nil
    t.decimal  "price_correct_qty"
    t.string   "pa_cmt_xface_flag",             limit: 1
    t.string   "cancellation_flag",             limit: 1
    t.decimal  "invoice_line_number"
    t.integer  "corrected_invoice_dist_id",     limit: nil
    t.decimal  "rounding_amt"
    t.integer  "charge_applicable_to_dist_id",  limit: nil
    t.decimal  "corrected_quantity"
    t.integer  "related_id",                    limit: nil
    t.string   "asset_book_type_code",          limit: 15
    t.integer  "asset_category_id",             limit: nil
    t.string   "distribution_class",            limit: 30
    t.decimal  "final_payment_rounding"
    t.decimal  "final_application_rounding"
    t.decimal  "amount_at_prepay_xrate"
    t.decimal  "cash_basis_final_app_rounding"
    t.decimal  "amount_at_prepay_pay_xrate"
    t.string   "intended_use",                  limit: 30
    t.integer  "detail_tax_dist_id",            limit: nil
    t.decimal  "rec_nrec_rate"
    t.integer  "recovery_rate_id",              limit: nil
    t.string   "recovery_rate_name",            limit: 150
    t.string   "recovery_type_code",            limit: 30
    t.string   "recovery_rate_code",            limit: 30
    t.integer  "withholding_tax_code_id",       limit: nil
    t.string   "tax_already_distributed_flag",  limit: 1
    t.integer  "summary_tax_line_id",           limit: nil
    t.decimal  "taxable_amount"
    t.decimal  "taxable_base_amount"
    t.decimal  "extra_po_erv"
    t.decimal  "prepay_tax_diff_amount"
    t.integer  "tax_code_id",                   limit: nil
    t.string   "vat_code",                      limit: 15
    t.string   "amount_includes_tax_flag",      limit: 1
    t.string   "tax_calculated_flag",           limit: 1
    t.decimal  "tax_recovery_rate"
    t.string   "tax_recovery_override_flag",    limit: 1
    t.string   "tax_code_override_flag",        limit: 1
    t.decimal  "total_dist_amount"
    t.decimal  "total_dist_base_amount"
    t.integer  "prepay_tax_parent_id",          limit: nil
    t.string   "cancelled_flag",                limit: 1
    t.integer  "old_distribution_id",           limit: nil
    t.integer  "old_dist_line_number",          limit: 15,   precision: 15
    t.decimal  "amount_variance"
    t.decimal  "base_amount_variance"
    t.string   "historical_flag",               limit: 1
    t.string   "rcv_charge_addition_flag",      limit: 1
    t.integer  "awt_related_id",                limit: nil
    t.integer  "related_retainage_dist_id",     limit: nil
    t.decimal  "retained_amount_remaining"
    t.integer  "bc_event_id",                   limit: nil
    t.integer  "retained_invoice_dist_id",      limit: nil
    t.decimal  "final_release_rounding"
    t.string   "fully_paid_acctd_flag",         limit: 1
    t.integer  "root_distribution_id",          limit: nil
    t.integer  "xinv_parent_reversal_id",       limit: nil
    t.integer  "recurring_payment_id",          limit: nil
    t.integer  "release_inv_dist_derived_from", limit: 15,   precision: 15
    t.integer  "pay_awt_group_id",              limit: nil
  end

  create_table "ap_invoice_dist20151102", id: false, force: :cascade do |t|
    t.datetime "accounting_date",                                                     null: false
    t.string   "accrual_posted_flag",           limit: 1
    t.string   "assets_addition_flag",          limit: 1,                             null: false
    t.string   "assets_tracking_flag",          limit: 1,                             null: false
    t.string   "cash_posted_flag",              limit: 1
    t.integer  "distribution_line_number",      limit: 15,   precision: 15,           null: false
    t.integer  "dist_code_combination_id",      limit: nil,                           null: false
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.datetime "last_update_date",                                                    null: false
    t.string   "line_type_lookup_code",         limit: 25,                            null: false
    t.string   "period_name",                   limit: 15,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.decimal  "amount"
    t.decimal  "base_amount"
    t.decimal  "base_invoice_price_variance"
    t.integer  "batch_id",                      limit: nil
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.datetime "creation_date"
    t.string   "description",                   limit: 240
    t.decimal  "exchange_rate_variance"
    t.string   "final_match_flag",              limit: 1
    t.string   "income_tax_region",             limit: 10
    t.decimal  "invoice_price_variance"
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "match_status_flag",             limit: 1
    t.string   "posted_flag",                   limit: 1
    t.integer  "po_distribution_id",            limit: nil
    t.integer  "program_application_id",        limit: nil
    t.integer  "program_id",                    limit: nil
    t.datetime "program_update_date"
    t.decimal  "quantity_invoiced"
    t.integer  "rate_var_code_combination_id",  limit: nil
    t.integer  "request_id",                    limit: nil
    t.string   "reversal_flag",                 limit: 1
    t.string   "type_1099",                     limit: 10
    t.decimal  "unit_price"
    t.decimal  "amount_encumbered"
    t.decimal  "base_amount_encumbered"
    t.string   "encumbered_flag",               limit: 1
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.string   "price_adjustment_flag",         limit: 1
    t.integer  "price_var_code_combination_id", limit: nil
    t.decimal  "quantity_unencumbered"
    t.decimal  "stat_amount"
    t.decimal  "amount_to_post"
    t.string   "attribute1",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute_category",            limit: 150
    t.decimal  "base_amount_to_post"
    t.integer  "cash_je_batch_id",              limit: nil
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",   limit: nil
    t.string   "expenditure_type",              limit: 30
    t.integer  "je_batch_id",                   limit: nil
    t.integer  "parent_invoice_id",             limit: nil
    t.string   "pa_addition_flag",              limit: 1
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.decimal  "posted_amount"
    t.decimal  "posted_base_amount"
    t.decimal  "prepay_amount_remaining"
    t.string   "project_accounting_context",    limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.datetime "earliest_settlement_date"
    t.integer  "req_distribution_id",           limit: nil
    t.decimal  "quantity_variance"
    t.decimal  "base_quantity_variance"
    t.integer  "packet_id",                     limit: nil
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.integer  "awt_tax_rate_id",               limit: nil
    t.decimal  "awt_gross_amount"
    t.integer  "awt_invoice_id",                limit: nil
    t.integer  "awt_origin_group_id",           limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.integer  "other_invoice_id",              limit: nil
    t.integer  "awt_invoice_payment_id",        limit: nil
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.integer  "line_group_number",             limit: 15,   precision: 15
    t.string   "receipt_verified_flag",         limit: 1
    t.string   "receipt_required_flag",         limit: 1
    t.string   "receipt_missing_flag",          limit: 1
    t.string   "justification",                 limit: 240
    t.string   "expense_group",                 limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",         limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",              limit: nil
    t.string   "adjustment_reason",             limit: 240
    t.integer  "award_id",                      limit: nil
    t.string   "mrc_accrual_posted_flag",       limit: 2000
    t.string   "mrc_cash_posted_flag",          limit: 2000
    t.string   "mrc_dist_code_combination_id",  limit: 2000
    t.string   "mrc_amount",                    limit: 2000
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_base_inv_price_variance",   limit: 2000
    t.string   "mrc_exchange_rate_variance",    limit: 2000
    t.string   "mrc_posted_flag",               limit: 2000
    t.string   "mrc_program_application_id",    limit: 2000
    t.string   "mrc_program_id",                limit: 2000
    t.string   "mrc_program_update_date",       limit: 2000
    t.string   "mrc_rate_var_ccid",             limit: 2000
    t.string   "mrc_request_id",                limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_amount_to_post",            limit: 2000
    t.string   "mrc_base_amount_to_post",       limit: 2000
    t.string   "mrc_cash_je_batch_id",          limit: 2000
    t.string   "mrc_je_batch_id",               limit: 2000
    t.string   "mrc_posted_amount",             limit: 2000
    t.string   "mrc_posted_base_amount",        limit: 2000
    t.string   "mrc_receipt_conversion_rate",   limit: 2000
    t.integer  "credit_card_trx_id",            limit: nil
    t.string   "dist_match_type",               limit: 25
    t.integer  "rcv_transaction_id",            limit: nil
    t.integer  "invoice_distribution_id",       limit: nil,                           null: false
    t.integer  "parent_reversal_id",            limit: nil
    t.string   "tax_recoverable_flag",          limit: 1
    t.integer  "pa_cc_ar_invoice_id",           limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",     limit: 15,   precision: 15
    t.string   "pa_cc_processed_code",          limit: 1
    t.string   "merchant_document_number",      limit: 80
    t.string   "merchant_name",                 limit: 80
    t.string   "merchant_reference",            limit: 240
    t.string   "merchant_tax_reg_number",       limit: 80
    t.string   "merchant_taxpayer_id",          limit: 80
    t.string   "country_of_supply",             limit: 5
    t.string   "matched_uom_lookup_code",       limit: 25
    t.decimal  "gms_burdenable_raw_cost",                    precision: 22, scale: 5
    t.integer  "accounting_event_id",           limit: nil
    t.integer  "prepay_distribution_id",        limit: nil
    t.decimal  "upgrade_posted_amt"
    t.decimal  "upgrade_base_posted_amt"
    t.string   "inventory_transfer_status",     limit: 1
    t.integer  "company_prepaid_invoice_id",    limit: nil
    t.string   "cc_reversal_flag",              limit: 1
    t.decimal  "awt_withheld_amt"
    t.string   "invoice_includes_prepay_flag",  limit: 1
    t.integer  "price_correct_inv_id",          limit: nil
    t.decimal  "price_correct_qty"
    t.string   "pa_cmt_xface_flag",             limit: 1
    t.string   "cancellation_flag",             limit: 1
    t.decimal  "invoice_line_number"
    t.integer  "corrected_invoice_dist_id",     limit: nil
    t.decimal  "rounding_amt"
    t.integer  "charge_applicable_to_dist_id",  limit: nil
    t.decimal  "corrected_quantity"
    t.integer  "related_id",                    limit: nil
    t.string   "asset_book_type_code",          limit: 15
    t.integer  "asset_category_id",             limit: nil
    t.string   "distribution_class",            limit: 30
    t.decimal  "final_payment_rounding"
    t.decimal  "final_application_rounding"
    t.decimal  "amount_at_prepay_xrate"
    t.decimal  "cash_basis_final_app_rounding"
    t.decimal  "amount_at_prepay_pay_xrate"
    t.string   "intended_use",                  limit: 30
    t.integer  "detail_tax_dist_id",            limit: nil
    t.decimal  "rec_nrec_rate"
    t.integer  "recovery_rate_id",              limit: nil
    t.string   "recovery_rate_name",            limit: 150
    t.string   "recovery_type_code",            limit: 30
    t.string   "recovery_rate_code",            limit: 30
    t.integer  "withholding_tax_code_id",       limit: nil
    t.string   "tax_already_distributed_flag",  limit: 1
    t.integer  "summary_tax_line_id",           limit: nil
    t.decimal  "taxable_amount"
    t.decimal  "taxable_base_amount"
    t.decimal  "extra_po_erv"
    t.decimal  "prepay_tax_diff_amount"
    t.integer  "tax_code_id",                   limit: nil
    t.string   "vat_code",                      limit: 15
    t.string   "amount_includes_tax_flag",      limit: 1
    t.string   "tax_calculated_flag",           limit: 1
    t.decimal  "tax_recovery_rate"
    t.string   "tax_recovery_override_flag",    limit: 1
    t.string   "tax_code_override_flag",        limit: 1
    t.decimal  "total_dist_amount"
    t.decimal  "total_dist_base_amount"
    t.integer  "prepay_tax_parent_id",          limit: nil
    t.string   "cancelled_flag",                limit: 1
    t.integer  "old_distribution_id",           limit: nil
    t.integer  "old_dist_line_number",          limit: 15,   precision: 15
    t.decimal  "amount_variance"
    t.decimal  "base_amount_variance"
    t.string   "historical_flag",               limit: 1
    t.string   "rcv_charge_addition_flag",      limit: 1
    t.integer  "awt_related_id",                limit: nil
    t.integer  "related_retainage_dist_id",     limit: nil
    t.decimal  "retained_amount_remaining"
    t.integer  "bc_event_id",                   limit: nil
    t.integer  "retained_invoice_dist_id",      limit: nil
    t.decimal  "final_release_rounding"
    t.string   "fully_paid_acctd_flag",         limit: 1
    t.integer  "root_distribution_id",          limit: nil
    t.integer  "xinv_parent_reversal_id",       limit: nil
    t.integer  "recurring_payment_id",          limit: nil
    t.integer  "release_inv_dist_derived_from", limit: 15,   precision: 15
    t.integer  "pay_awt_group_id",              limit: nil
  end

  create_table "ap_invoice_dist20160729", id: false, force: :cascade do |t|
    t.datetime "accounting_date",                                                     null: false
    t.string   "accrual_posted_flag",           limit: 1
    t.string   "assets_addition_flag",          limit: 1,                             null: false
    t.string   "assets_tracking_flag",          limit: 1,                             null: false
    t.string   "cash_posted_flag",              limit: 1
    t.integer  "distribution_line_number",      limit: 15,   precision: 15,           null: false
    t.integer  "dist_code_combination_id",      limit: nil,                           null: false
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.datetime "last_update_date",                                                    null: false
    t.string   "line_type_lookup_code",         limit: 25,                            null: false
    t.string   "period_name",                   limit: 15,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.decimal  "amount"
    t.decimal  "base_amount"
    t.decimal  "base_invoice_price_variance"
    t.integer  "batch_id",                      limit: nil
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.datetime "creation_date"
    t.string   "description",                   limit: 240
    t.decimal  "exchange_rate_variance"
    t.string   "final_match_flag",              limit: 1
    t.string   "income_tax_region",             limit: 10
    t.decimal  "invoice_price_variance"
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "match_status_flag",             limit: 1
    t.string   "posted_flag",                   limit: 1
    t.integer  "po_distribution_id",            limit: nil
    t.integer  "program_application_id",        limit: nil
    t.integer  "program_id",                    limit: nil
    t.datetime "program_update_date"
    t.decimal  "quantity_invoiced"
    t.integer  "rate_var_code_combination_id",  limit: nil
    t.integer  "request_id",                    limit: nil
    t.string   "reversal_flag",                 limit: 1
    t.string   "type_1099",                     limit: 10
    t.decimal  "unit_price"
    t.decimal  "amount_encumbered"
    t.decimal  "base_amount_encumbered"
    t.string   "encumbered_flag",               limit: 1
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.string   "price_adjustment_flag",         limit: 1
    t.integer  "price_var_code_combination_id", limit: nil
    t.decimal  "quantity_unencumbered"
    t.decimal  "stat_amount"
    t.decimal  "amount_to_post"
    t.string   "attribute1",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute_category",            limit: 150
    t.decimal  "base_amount_to_post"
    t.integer  "cash_je_batch_id",              limit: nil
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",   limit: nil
    t.string   "expenditure_type",              limit: 30
    t.integer  "je_batch_id",                   limit: nil
    t.integer  "parent_invoice_id",             limit: nil
    t.string   "pa_addition_flag",              limit: 1
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.decimal  "posted_amount"
    t.decimal  "posted_base_amount"
    t.decimal  "prepay_amount_remaining"
    t.string   "project_accounting_context",    limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.datetime "earliest_settlement_date"
    t.integer  "req_distribution_id",           limit: nil
    t.decimal  "quantity_variance"
    t.decimal  "base_quantity_variance"
    t.integer  "packet_id",                     limit: nil
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.integer  "awt_tax_rate_id",               limit: nil
    t.decimal  "awt_gross_amount"
    t.integer  "awt_invoice_id",                limit: nil
    t.integer  "awt_origin_group_id",           limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.integer  "other_invoice_id",              limit: nil
    t.integer  "awt_invoice_payment_id",        limit: nil
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.integer  "line_group_number",             limit: 15,   precision: 15
    t.string   "receipt_verified_flag",         limit: 1
    t.string   "receipt_required_flag",         limit: 1
    t.string   "receipt_missing_flag",          limit: 1
    t.string   "justification",                 limit: 240
    t.string   "expense_group",                 limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",         limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",              limit: nil
    t.string   "adjustment_reason",             limit: 240
    t.integer  "award_id",                      limit: nil
    t.string   "mrc_accrual_posted_flag",       limit: 2000
    t.string   "mrc_cash_posted_flag",          limit: 2000
    t.string   "mrc_dist_code_combination_id",  limit: 2000
    t.string   "mrc_amount",                    limit: 2000
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_base_inv_price_variance",   limit: 2000
    t.string   "mrc_exchange_rate_variance",    limit: 2000
    t.string   "mrc_posted_flag",               limit: 2000
    t.string   "mrc_program_application_id",    limit: 2000
    t.string   "mrc_program_id",                limit: 2000
    t.string   "mrc_program_update_date",       limit: 2000
    t.string   "mrc_rate_var_ccid",             limit: 2000
    t.string   "mrc_request_id",                limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_amount_to_post",            limit: 2000
    t.string   "mrc_base_amount_to_post",       limit: 2000
    t.string   "mrc_cash_je_batch_id",          limit: 2000
    t.string   "mrc_je_batch_id",               limit: 2000
    t.string   "mrc_posted_amount",             limit: 2000
    t.string   "mrc_posted_base_amount",        limit: 2000
    t.string   "mrc_receipt_conversion_rate",   limit: 2000
    t.integer  "credit_card_trx_id",            limit: nil
    t.string   "dist_match_type",               limit: 25
    t.integer  "rcv_transaction_id",            limit: nil
    t.integer  "invoice_distribution_id",       limit: nil,                           null: false
    t.integer  "parent_reversal_id",            limit: nil
    t.string   "tax_recoverable_flag",          limit: 1
    t.integer  "pa_cc_ar_invoice_id",           limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",     limit: 15,   precision: 15
    t.string   "pa_cc_processed_code",          limit: 1
    t.string   "merchant_document_number",      limit: 80
    t.string   "merchant_name",                 limit: 80
    t.string   "merchant_reference",            limit: 240
    t.string   "merchant_tax_reg_number",       limit: 80
    t.string   "merchant_taxpayer_id",          limit: 80
    t.string   "country_of_supply",             limit: 5
    t.string   "matched_uom_lookup_code",       limit: 25
    t.decimal  "gms_burdenable_raw_cost",                    precision: 22, scale: 5
    t.integer  "accounting_event_id",           limit: nil
    t.integer  "prepay_distribution_id",        limit: nil
    t.decimal  "upgrade_posted_amt"
    t.decimal  "upgrade_base_posted_amt"
    t.string   "inventory_transfer_status",     limit: 1
    t.integer  "company_prepaid_invoice_id",    limit: nil
    t.string   "cc_reversal_flag",              limit: 1
    t.decimal  "awt_withheld_amt"
    t.string   "invoice_includes_prepay_flag",  limit: 1
    t.integer  "price_correct_inv_id",          limit: nil
    t.decimal  "price_correct_qty"
    t.string   "pa_cmt_xface_flag",             limit: 1
    t.string   "cancellation_flag",             limit: 1
    t.decimal  "invoice_line_number"
    t.integer  "corrected_invoice_dist_id",     limit: nil
    t.decimal  "rounding_amt"
    t.integer  "charge_applicable_to_dist_id",  limit: nil
    t.decimal  "corrected_quantity"
    t.integer  "related_id",                    limit: nil
    t.string   "asset_book_type_code",          limit: 15
    t.integer  "asset_category_id",             limit: nil
    t.string   "distribution_class",            limit: 30
    t.decimal  "final_payment_rounding"
    t.decimal  "final_application_rounding"
    t.decimal  "amount_at_prepay_xrate"
    t.decimal  "cash_basis_final_app_rounding"
    t.decimal  "amount_at_prepay_pay_xrate"
    t.string   "intended_use",                  limit: 30
    t.integer  "detail_tax_dist_id",            limit: nil
    t.decimal  "rec_nrec_rate"
    t.integer  "recovery_rate_id",              limit: nil
    t.string   "recovery_rate_name",            limit: 150
    t.string   "recovery_type_code",            limit: 30
    t.string   "recovery_rate_code",            limit: 30
    t.integer  "withholding_tax_code_id",       limit: nil
    t.string   "tax_already_distributed_flag",  limit: 1
    t.integer  "summary_tax_line_id",           limit: nil
    t.decimal  "taxable_amount"
    t.decimal  "taxable_base_amount"
    t.decimal  "extra_po_erv"
    t.decimal  "prepay_tax_diff_amount"
    t.integer  "tax_code_id",                   limit: nil
    t.string   "vat_code",                      limit: 15
    t.string   "amount_includes_tax_flag",      limit: 1
    t.string   "tax_calculated_flag",           limit: 1
    t.decimal  "tax_recovery_rate"
    t.string   "tax_recovery_override_flag",    limit: 1
    t.string   "tax_code_override_flag",        limit: 1
    t.decimal  "total_dist_amount"
    t.decimal  "total_dist_base_amount"
    t.integer  "prepay_tax_parent_id",          limit: nil
    t.string   "cancelled_flag",                limit: 1
    t.integer  "old_distribution_id",           limit: nil
    t.integer  "old_dist_line_number",          limit: 15,   precision: 15
    t.decimal  "amount_variance"
    t.decimal  "base_amount_variance"
    t.string   "historical_flag",               limit: 1
    t.string   "rcv_charge_addition_flag",      limit: 1
    t.integer  "awt_related_id",                limit: nil
    t.integer  "related_retainage_dist_id",     limit: nil
    t.decimal  "retained_amount_remaining"
    t.integer  "bc_event_id",                   limit: nil
    t.integer  "retained_invoice_dist_id",      limit: nil
    t.decimal  "final_release_rounding"
    t.string   "fully_paid_acctd_flag",         limit: 1
    t.integer  "root_distribution_id",          limit: nil
    t.integer  "xinv_parent_reversal_id",       limit: nil
    t.integer  "recurring_payment_id",          limit: nil
    t.integer  "release_inv_dist_derived_from", limit: 15,   precision: 15
    t.integer  "pay_awt_group_id",              limit: nil
  end

  create_table "ap_invoice_distributions170504", id: false, force: :cascade do |t|
    t.datetime "accounting_date",                                                     null: false
    t.string   "accrual_posted_flag",           limit: 1
    t.string   "assets_addition_flag",          limit: 1,                             null: false
    t.string   "assets_tracking_flag",          limit: 1,                             null: false
    t.string   "cash_posted_flag",              limit: 1
    t.integer  "distribution_line_number",      limit: 15,   precision: 15,           null: false
    t.integer  "dist_code_combination_id",      limit: nil,                           null: false
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.datetime "last_update_date",                                                    null: false
    t.string   "line_type_lookup_code",         limit: 25,                            null: false
    t.string   "period_name",                   limit: 15,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.decimal  "amount"
    t.decimal  "base_amount"
    t.decimal  "base_invoice_price_variance"
    t.integer  "batch_id",                      limit: nil
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.datetime "creation_date"
    t.string   "description",                   limit: 240
    t.decimal  "exchange_rate_variance"
    t.string   "final_match_flag",              limit: 1
    t.string   "income_tax_region",             limit: 10
    t.decimal  "invoice_price_variance"
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "match_status_flag",             limit: 1
    t.string   "posted_flag",                   limit: 1
    t.integer  "po_distribution_id",            limit: nil
    t.integer  "program_application_id",        limit: nil
    t.integer  "program_id",                    limit: nil
    t.datetime "program_update_date"
    t.decimal  "quantity_invoiced"
    t.integer  "rate_var_code_combination_id",  limit: nil
    t.integer  "request_id",                    limit: nil
    t.string   "reversal_flag",                 limit: 1
    t.string   "type_1099",                     limit: 10
    t.decimal  "unit_price"
    t.decimal  "amount_encumbered"
    t.decimal  "base_amount_encumbered"
    t.string   "encumbered_flag",               limit: 1
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.string   "price_adjustment_flag",         limit: 1
    t.integer  "price_var_code_combination_id", limit: nil
    t.decimal  "quantity_unencumbered"
    t.decimal  "stat_amount"
    t.decimal  "amount_to_post"
    t.string   "attribute1",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute_category",            limit: 150
    t.decimal  "base_amount_to_post"
    t.integer  "cash_je_batch_id",              limit: nil
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",   limit: nil
    t.string   "expenditure_type",              limit: 30
    t.integer  "je_batch_id",                   limit: nil
    t.integer  "parent_invoice_id",             limit: nil
    t.string   "pa_addition_flag",              limit: 1
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.decimal  "posted_amount"
    t.decimal  "posted_base_amount"
    t.decimal  "prepay_amount_remaining"
    t.string   "project_accounting_context",    limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.datetime "earliest_settlement_date"
    t.integer  "req_distribution_id",           limit: nil
    t.decimal  "quantity_variance"
    t.decimal  "base_quantity_variance"
    t.integer  "packet_id",                     limit: nil
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.integer  "awt_tax_rate_id",               limit: nil
    t.decimal  "awt_gross_amount"
    t.integer  "awt_invoice_id",                limit: nil
    t.integer  "awt_origin_group_id",           limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.integer  "other_invoice_id",              limit: nil
    t.integer  "awt_invoice_payment_id",        limit: nil
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.integer  "line_group_number",             limit: 15,   precision: 15
    t.string   "receipt_verified_flag",         limit: 1
    t.string   "receipt_required_flag",         limit: 1
    t.string   "receipt_missing_flag",          limit: 1
    t.string   "justification",                 limit: 240
    t.string   "expense_group",                 limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",         limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",              limit: nil
    t.string   "adjustment_reason",             limit: 240
    t.integer  "award_id",                      limit: nil
    t.string   "mrc_accrual_posted_flag",       limit: 2000
    t.string   "mrc_cash_posted_flag",          limit: 2000
    t.string   "mrc_dist_code_combination_id",  limit: 2000
    t.string   "mrc_amount",                    limit: 2000
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_base_inv_price_variance",   limit: 2000
    t.string   "mrc_exchange_rate_variance",    limit: 2000
    t.string   "mrc_posted_flag",               limit: 2000
    t.string   "mrc_program_application_id",    limit: 2000
    t.string   "mrc_program_id",                limit: 2000
    t.string   "mrc_program_update_date",       limit: 2000
    t.string   "mrc_rate_var_ccid",             limit: 2000
    t.string   "mrc_request_id",                limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_amount_to_post",            limit: 2000
    t.string   "mrc_base_amount_to_post",       limit: 2000
    t.string   "mrc_cash_je_batch_id",          limit: 2000
    t.string   "mrc_je_batch_id",               limit: 2000
    t.string   "mrc_posted_amount",             limit: 2000
    t.string   "mrc_posted_base_amount",        limit: 2000
    t.string   "mrc_receipt_conversion_rate",   limit: 2000
    t.integer  "credit_card_trx_id",            limit: nil
    t.string   "dist_match_type",               limit: 25
    t.integer  "rcv_transaction_id",            limit: nil
    t.integer  "invoice_distribution_id",       limit: nil,                           null: false
    t.integer  "parent_reversal_id",            limit: nil
    t.string   "tax_recoverable_flag",          limit: 1
    t.integer  "pa_cc_ar_invoice_id",           limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",     limit: 15,   precision: 15
    t.string   "pa_cc_processed_code",          limit: 1
    t.string   "merchant_document_number",      limit: 80
    t.string   "merchant_name",                 limit: 80
    t.string   "merchant_reference",            limit: 240
    t.string   "merchant_tax_reg_number",       limit: 80
    t.string   "merchant_taxpayer_id",          limit: 80
    t.string   "country_of_supply",             limit: 5
    t.string   "matched_uom_lookup_code",       limit: 25
    t.decimal  "gms_burdenable_raw_cost",                    precision: 22, scale: 5
    t.integer  "accounting_event_id",           limit: nil
    t.integer  "prepay_distribution_id",        limit: nil
    t.decimal  "upgrade_posted_amt"
    t.decimal  "upgrade_base_posted_amt"
    t.string   "inventory_transfer_status",     limit: 1
    t.integer  "company_prepaid_invoice_id",    limit: nil
    t.string   "cc_reversal_flag",              limit: 1
    t.decimal  "awt_withheld_amt"
    t.string   "invoice_includes_prepay_flag",  limit: 1
    t.integer  "price_correct_inv_id",          limit: nil
    t.decimal  "price_correct_qty"
    t.string   "pa_cmt_xface_flag",             limit: 1
    t.string   "cancellation_flag",             limit: 1
    t.decimal  "invoice_line_number"
    t.integer  "corrected_invoice_dist_id",     limit: nil
    t.decimal  "rounding_amt"
    t.integer  "charge_applicable_to_dist_id",  limit: nil
    t.decimal  "corrected_quantity"
    t.integer  "related_id",                    limit: nil
    t.string   "asset_book_type_code",          limit: 15
    t.integer  "asset_category_id",             limit: nil
    t.string   "distribution_class",            limit: 30
    t.decimal  "final_payment_rounding"
    t.decimal  "final_application_rounding"
    t.decimal  "amount_at_prepay_xrate"
    t.decimal  "cash_basis_final_app_rounding"
    t.decimal  "amount_at_prepay_pay_xrate"
    t.string   "intended_use",                  limit: 30
    t.integer  "detail_tax_dist_id",            limit: nil
    t.decimal  "rec_nrec_rate"
    t.integer  "recovery_rate_id",              limit: nil
    t.string   "recovery_rate_name",            limit: 150
    t.string   "recovery_type_code",            limit: 30
    t.string   "recovery_rate_code",            limit: 30
    t.integer  "withholding_tax_code_id",       limit: nil
    t.string   "tax_already_distributed_flag",  limit: 1
    t.integer  "summary_tax_line_id",           limit: nil
    t.decimal  "taxable_amount"
    t.decimal  "taxable_base_amount"
    t.decimal  "extra_po_erv"
    t.decimal  "prepay_tax_diff_amount"
    t.integer  "tax_code_id",                   limit: nil
    t.string   "vat_code",                      limit: 15
    t.string   "amount_includes_tax_flag",      limit: 1
    t.string   "tax_calculated_flag",           limit: 1
    t.decimal  "tax_recovery_rate"
    t.string   "tax_recovery_override_flag",    limit: 1
    t.string   "tax_code_override_flag",        limit: 1
    t.decimal  "total_dist_amount"
    t.decimal  "total_dist_base_amount"
    t.integer  "prepay_tax_parent_id",          limit: nil
    t.string   "cancelled_flag",                limit: 1
    t.integer  "old_distribution_id",           limit: nil
    t.integer  "old_dist_line_number",          limit: 15,   precision: 15
    t.decimal  "amount_variance"
    t.decimal  "base_amount_variance"
    t.string   "historical_flag",               limit: 1
    t.string   "rcv_charge_addition_flag",      limit: 1
    t.integer  "awt_related_id",                limit: nil
    t.integer  "related_retainage_dist_id",     limit: nil
    t.decimal  "retained_amount_remaining"
    t.integer  "bc_event_id",                   limit: nil
    t.integer  "retained_invoice_dist_id",      limit: nil
    t.decimal  "final_release_rounding"
    t.string   "fully_paid_acctd_flag",         limit: 1
    t.integer  "root_distribution_id",          limit: nil
    t.integer  "xinv_parent_reversal_id",       limit: nil
    t.integer  "recurring_payment_id",          limit: nil
    t.integer  "release_inv_dist_derived_from", limit: 15,   precision: 15
    t.integer  "pay_awt_group_id",              limit: nil
  end

  create_table "ap_invoice_distributions_gt", temporary: true, id: false, force: :cascade do |t|
    t.integer  "invoice_distribution_id",      limit: nil
    t.integer  "invoice_id",                   limit: nil
    t.decimal  "invoice_line_number"
    t.integer  "po_distribution_id",           limit: nil
    t.integer  "org_id",                       limit: nil
    t.integer  "accounting_event_id",          limit: nil
    t.string   "description",                  limit: 240
    t.integer  "asset_category_id",            limit: nil
    t.decimal  "quantity_invoiced"
    t.string   "historical_flag",              limit: 1
    t.decimal  "corrected_quantity"
    t.integer  "dist_code_combination_id",     limit: nil
    t.string   "line_type_lookup_code",        limit: 25
    t.integer  "distribution_line_number",     limit: 15,  precision: 15
    t.datetime "accounting_date"
    t.integer  "corrected_invoice_dist_id",    limit: nil
    t.integer  "related_id",                   limit: nil
    t.integer  "charge_applicable_to_dist_id", limit: nil
    t.string   "asset_book_type_code",         limit: 15
    t.integer  "set_of_books_id",              limit: nil
  end

  create_table "ap_invoice_lines_all170504", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                     limit: nil,                null: false
    t.decimal  "line_number",                                               null: false
    t.string   "line_type_lookup_code",          limit: 25,                 null: false
    t.integer  "requester_id",                   limit: nil
    t.string   "description",                    limit: 240
    t.string   "line_source",                    limit: 30
    t.integer  "org_id",                         limit: nil
    t.decimal  "line_group_number"
    t.integer  "inventory_item_id",              limit: nil
    t.string   "item_description",               limit: 240
    t.string   "serial_number",                  limit: 35
    t.string   "manufacturer",                   limit: 30
    t.string   "model_number",                   limit: 40
    t.string   "warranty_number",                limit: 15
    t.string   "generate_dists",                 limit: 1
    t.string   "match_type",                     limit: 25
    t.integer  "distribution_set_id",            limit: nil
    t.string   "account_segment",                limit: 25
    t.string   "balancing_segment",              limit: 25
    t.string   "cost_center_segment",            limit: 25
    t.string   "overlay_dist_code_concat",       limit: 250
    t.integer  "default_dist_ccid",              limit: 15,  precision: 15
    t.string   "prorate_across_all_items",       limit: 1
    t.datetime "accounting_date",                                           null: false
    t.string   "period_name",                    limit: 15
    t.string   "deferred_acctg_flag",            limit: 1
    t.datetime "def_acctg_start_date"
    t.datetime "def_acctg_end_date"
    t.decimal  "def_acctg_number_of_periods"
    t.string   "def_acctg_period_type",          limit: 30
    t.integer  "set_of_books_id",                limit: nil,                null: false
    t.decimal  "amount",                                                    null: false
    t.decimal  "base_amount"
    t.decimal  "rounding_amt"
    t.decimal  "quantity_invoiced"
    t.string   "unit_meas_lookup_code",          limit: 25
    t.decimal  "unit_price"
    t.string   "wfapproval_status",              limit: 30,                 null: false
    t.string   "ussgl_transaction_code",         limit: 30
    t.string   "discarded_flag",                 limit: 1
    t.decimal  "original_amount"
    t.decimal  "original_base_amount"
    t.decimal  "original_rounding_amt"
    t.string   "cancelled_flag",                 limit: 1
    t.string   "income_tax_region",              limit: 10
    t.string   "type_1099",                      limit: 10
    t.decimal  "stat_amount"
    t.integer  "prepay_invoice_id",              limit: nil
    t.decimal  "prepay_line_number"
    t.string   "invoice_includes_prepay_flag",   limit: 1
    t.integer  "corrected_inv_id",               limit: nil
    t.decimal  "corrected_line_number"
    t.integer  "po_header_id",                   limit: nil
    t.integer  "po_line_id",                     limit: nil
    t.integer  "po_release_id",                  limit: nil
    t.integer  "po_line_location_id",            limit: nil
    t.integer  "po_distribution_id",             limit: nil
    t.integer  "rcv_transaction_id",             limit: nil
    t.string   "final_match_flag",               limit: 1
    t.string   "assets_tracking_flag",           limit: 1
    t.string   "asset_book_type_code",           limit: 15
    t.integer  "asset_category_id",              limit: nil
    t.integer  "project_id",                     limit: nil
    t.integer  "task_id",                        limit: nil
    t.string   "expenditure_type",               limit: 30
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",    limit: nil
    t.decimal  "pa_quantity"
    t.integer  "pa_cc_ar_invoice_id",            limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",      limit: 15,  precision: 15
    t.string   "pa_cc_processed_code",           limit: 1
    t.integer  "award_id",                       limit: nil
    t.integer  "awt_group_id",                   limit: nil
    t.string   "reference_1",                    limit: 30
    t.string   "reference_2",                    limit: 30
    t.string   "receipt_verified_flag",          limit: 1
    t.string   "receipt_required_flag",          limit: 1
    t.string   "receipt_missing_flag",           limit: 1
    t.string   "justification",                  limit: 240
    t.string   "expense_group",                  limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",          limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",               limit: nil
    t.string   "adjustment_reason",              limit: 240
    t.string   "merchant_document_number",       limit: 80
    t.string   "merchant_name",                  limit: 80
    t.string   "merchant_reference",             limit: 240
    t.string   "merchant_tax_reg_number",        limit: 80
    t.string   "merchant_taxpayer_id",           limit: 80
    t.string   "country_of_supply",              limit: 5
    t.integer  "credit_card_trx_id",             limit: nil
    t.integer  "company_prepaid_invoice_id",     limit: nil
    t.string   "cc_reversal_flag",               limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                     limit: 15,  precision: 15
    t.integer  "last_updated_by",                limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                                          null: false
    t.integer  "last_update_login",              limit: 15,  precision: 15
    t.integer  "program_application_id",         limit: nil
    t.integer  "program_id",                     limit: nil
    t.datetime "program_update_date"
    t.integer  "request_id",                     limit: nil
    t.string   "attribute_category",             limit: 150
    t.string   "attribute1",                     limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.string   "line_selected_for_appl_flag",    limit: 1
    t.integer  "prepay_appl_request_id",         limit: nil
    t.integer  "application_id",                 limit: nil
    t.string   "product_table",                  limit: 30
    t.string   "reference_key1",                 limit: 150
    t.string   "reference_key2",                 limit: 150
    t.string   "reference_key3",                 limit: 150
    t.string   "reference_key4",                 limit: 150
    t.string   "reference_key5",                 limit: 150
    t.integer  "purchasing_category_id",         limit: nil
    t.integer  "cost_factor_id",                 limit: nil
    t.decimal  "control_amount"
    t.decimal  "assessable_value"
    t.decimal  "total_rec_tax_amount"
    t.decimal  "total_nrec_tax_amount"
    t.decimal  "total_rec_tax_amt_funcl_curr"
    t.decimal  "total_nrec_tax_amt_funcl_curr"
    t.decimal  "included_tax_amount"
    t.string   "primary_intended_use",           limit: 30
    t.string   "tax_already_calculated_flag",    limit: 1
    t.integer  "ship_to_location_id",            limit: nil
    t.string   "product_type",                   limit: 240
    t.string   "product_category",               limit: 240
    t.string   "product_fisc_classification",    limit: 240
    t.string   "user_defined_fisc_class",        limit: 240
    t.string   "trx_business_category",          limit: 240
    t.integer  "summary_tax_line_id",            limit: nil
    t.string   "tax_regime_code",                limit: 30
    t.string   "tax",                            limit: 30
    t.string   "tax_jurisdiction_code",          limit: 30
    t.string   "tax_status_code",                limit: 30
    t.integer  "tax_rate_id",                    limit: nil
    t.string   "tax_rate_code",                  limit: 150
    t.decimal  "tax_rate"
    t.integer  "tax_code_id",                    limit: nil
    t.string   "historical_flag",                limit: 1
    t.string   "tax_classification_code",        limit: 30
    t.integer  "source_application_id",          limit: nil
    t.string   "source_event_class_code",        limit: 30
    t.string   "source_entity_code",             limit: 30
    t.integer  "source_trx_id",                  limit: nil
    t.integer  "source_line_id",                 limit: nil
    t.string   "source_trx_level_type",          limit: 30
    t.decimal  "retained_amount"
    t.decimal  "retained_amount_remaining"
    t.integer  "retained_invoice_id",            limit: nil
    t.decimal  "retained_line_number"
    t.string   "line_selected_for_release_flag", limit: 1
    t.string   "line_owner_role",                limit: 320
    t.string   "disputable_flag",                limit: 1
    t.integer  "rcv_shipment_line_id",           limit: nil
    t.integer  "ail_invoice_id",                 limit: nil
    t.integer  "ail_distribution_line_number",   limit: 15,  precision: 15
    t.integer  "ail_invoice_id2",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number2",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id3",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number3",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id4",                limit: 15,  precision: 15
    t.integer  "pay_awt_group_id",               limit: nil
  end

  create_table "ap_invoice_lines_all20150908", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                     limit: nil,                null: false
    t.decimal  "line_number",                                               null: false
    t.string   "line_type_lookup_code",          limit: 25,                 null: false
    t.integer  "requester_id",                   limit: nil
    t.string   "description",                    limit: 240
    t.string   "line_source",                    limit: 30
    t.integer  "org_id",                         limit: nil
    t.decimal  "line_group_number"
    t.integer  "inventory_item_id",              limit: nil
    t.string   "item_description",               limit: 240
    t.string   "serial_number",                  limit: 35
    t.string   "manufacturer",                   limit: 30
    t.string   "model_number",                   limit: 40
    t.string   "warranty_number",                limit: 15
    t.string   "generate_dists",                 limit: 1
    t.string   "match_type",                     limit: 25
    t.integer  "distribution_set_id",            limit: nil
    t.string   "account_segment",                limit: 25
    t.string   "balancing_segment",              limit: 25
    t.string   "cost_center_segment",            limit: 25
    t.string   "overlay_dist_code_concat",       limit: 250
    t.integer  "default_dist_ccid",              limit: 15,  precision: 15
    t.string   "prorate_across_all_items",       limit: 1
    t.datetime "accounting_date",                                           null: false
    t.string   "period_name",                    limit: 15
    t.string   "deferred_acctg_flag",            limit: 1
    t.datetime "def_acctg_start_date"
    t.datetime "def_acctg_end_date"
    t.decimal  "def_acctg_number_of_periods"
    t.string   "def_acctg_period_type",          limit: 30
    t.integer  "set_of_books_id",                limit: nil,                null: false
    t.decimal  "amount",                                                    null: false
    t.decimal  "base_amount"
    t.decimal  "rounding_amt"
    t.decimal  "quantity_invoiced"
    t.string   "unit_meas_lookup_code",          limit: 25
    t.decimal  "unit_price"
    t.string   "wfapproval_status",              limit: 30,                 null: false
    t.string   "ussgl_transaction_code",         limit: 30
    t.string   "discarded_flag",                 limit: 1
    t.decimal  "original_amount"
    t.decimal  "original_base_amount"
    t.decimal  "original_rounding_amt"
    t.string   "cancelled_flag",                 limit: 1
    t.string   "income_tax_region",              limit: 10
    t.string   "type_1099",                      limit: 10
    t.decimal  "stat_amount"
    t.integer  "prepay_invoice_id",              limit: nil
    t.decimal  "prepay_line_number"
    t.string   "invoice_includes_prepay_flag",   limit: 1
    t.integer  "corrected_inv_id",               limit: nil
    t.decimal  "corrected_line_number"
    t.integer  "po_header_id",                   limit: nil
    t.integer  "po_line_id",                     limit: nil
    t.integer  "po_release_id",                  limit: nil
    t.integer  "po_line_location_id",            limit: nil
    t.integer  "po_distribution_id",             limit: nil
    t.integer  "rcv_transaction_id",             limit: nil
    t.string   "final_match_flag",               limit: 1
    t.string   "assets_tracking_flag",           limit: 1
    t.string   "asset_book_type_code",           limit: 15
    t.integer  "asset_category_id",              limit: nil
    t.integer  "project_id",                     limit: nil
    t.integer  "task_id",                        limit: nil
    t.string   "expenditure_type",               limit: 30
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",    limit: nil
    t.decimal  "pa_quantity"
    t.integer  "pa_cc_ar_invoice_id",            limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",      limit: 15,  precision: 15
    t.string   "pa_cc_processed_code",           limit: 1
    t.integer  "award_id",                       limit: nil
    t.integer  "awt_group_id",                   limit: nil
    t.string   "reference_1",                    limit: 30
    t.string   "reference_2",                    limit: 30
    t.string   "receipt_verified_flag",          limit: 1
    t.string   "receipt_required_flag",          limit: 1
    t.string   "receipt_missing_flag",           limit: 1
    t.string   "justification",                  limit: 240
    t.string   "expense_group",                  limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",          limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",               limit: nil
    t.string   "adjustment_reason",              limit: 240
    t.string   "merchant_document_number",       limit: 80
    t.string   "merchant_name",                  limit: 80
    t.string   "merchant_reference",             limit: 240
    t.string   "merchant_tax_reg_number",        limit: 80
    t.string   "merchant_taxpayer_id",           limit: 80
    t.string   "country_of_supply",              limit: 5
    t.integer  "credit_card_trx_id",             limit: nil
    t.integer  "company_prepaid_invoice_id",     limit: nil
    t.string   "cc_reversal_flag",               limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                     limit: 15,  precision: 15
    t.integer  "last_updated_by",                limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                                          null: false
    t.integer  "last_update_login",              limit: 15,  precision: 15
    t.integer  "program_application_id",         limit: nil
    t.integer  "program_id",                     limit: nil
    t.datetime "program_update_date"
    t.integer  "request_id",                     limit: nil
    t.string   "attribute_category",             limit: 150
    t.string   "attribute1",                     limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.string   "line_selected_for_appl_flag",    limit: 1
    t.integer  "prepay_appl_request_id",         limit: nil
    t.integer  "application_id",                 limit: nil
    t.string   "product_table",                  limit: 30
    t.string   "reference_key1",                 limit: 150
    t.string   "reference_key2",                 limit: 150
    t.string   "reference_key3",                 limit: 150
    t.string   "reference_key4",                 limit: 150
    t.string   "reference_key5",                 limit: 150
    t.integer  "purchasing_category_id",         limit: nil
    t.integer  "cost_factor_id",                 limit: nil
    t.decimal  "control_amount"
    t.decimal  "assessable_value"
    t.decimal  "total_rec_tax_amount"
    t.decimal  "total_nrec_tax_amount"
    t.decimal  "total_rec_tax_amt_funcl_curr"
    t.decimal  "total_nrec_tax_amt_funcl_curr"
    t.decimal  "included_tax_amount"
    t.string   "primary_intended_use",           limit: 30
    t.string   "tax_already_calculated_flag",    limit: 1
    t.integer  "ship_to_location_id",            limit: nil
    t.string   "product_type",                   limit: 240
    t.string   "product_category",               limit: 240
    t.string   "product_fisc_classification",    limit: 240
    t.string   "user_defined_fisc_class",        limit: 240
    t.string   "trx_business_category",          limit: 240
    t.integer  "summary_tax_line_id",            limit: nil
    t.string   "tax_regime_code",                limit: 30
    t.string   "tax",                            limit: 30
    t.string   "tax_jurisdiction_code",          limit: 30
    t.string   "tax_status_code",                limit: 30
    t.integer  "tax_rate_id",                    limit: nil
    t.string   "tax_rate_code",                  limit: 150
    t.decimal  "tax_rate"
    t.integer  "tax_code_id",                    limit: nil
    t.string   "historical_flag",                limit: 1
    t.string   "tax_classification_code",        limit: 30
    t.integer  "source_application_id",          limit: nil
    t.string   "source_event_class_code",        limit: 30
    t.string   "source_entity_code",             limit: 30
    t.integer  "source_trx_id",                  limit: nil
    t.integer  "source_line_id",                 limit: nil
    t.string   "source_trx_level_type",          limit: 30
    t.decimal  "retained_amount"
    t.decimal  "retained_amount_remaining"
    t.integer  "retained_invoice_id",            limit: nil
    t.decimal  "retained_line_number"
    t.string   "line_selected_for_release_flag", limit: 1
    t.string   "line_owner_role",                limit: 320
    t.string   "disputable_flag",                limit: 1
    t.integer  "rcv_shipment_line_id",           limit: nil
    t.integer  "ail_invoice_id",                 limit: nil
    t.integer  "ail_distribution_line_number",   limit: 15,  precision: 15
    t.integer  "ail_invoice_id2",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number2",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id3",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number3",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id4",                limit: 15,  precision: 15
    t.integer  "pay_awt_group_id",               limit: nil
  end

  create_table "ap_invoice_lines_all20151102", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                     limit: nil,                null: false
    t.decimal  "line_number",                                               null: false
    t.string   "line_type_lookup_code",          limit: 25,                 null: false
    t.integer  "requester_id",                   limit: nil
    t.string   "description",                    limit: 240
    t.string   "line_source",                    limit: 30
    t.integer  "org_id",                         limit: nil
    t.decimal  "line_group_number"
    t.integer  "inventory_item_id",              limit: nil
    t.string   "item_description",               limit: 240
    t.string   "serial_number",                  limit: 35
    t.string   "manufacturer",                   limit: 30
    t.string   "model_number",                   limit: 40
    t.string   "warranty_number",                limit: 15
    t.string   "generate_dists",                 limit: 1
    t.string   "match_type",                     limit: 25
    t.integer  "distribution_set_id",            limit: nil
    t.string   "account_segment",                limit: 25
    t.string   "balancing_segment",              limit: 25
    t.string   "cost_center_segment",            limit: 25
    t.string   "overlay_dist_code_concat",       limit: 250
    t.integer  "default_dist_ccid",              limit: 15,  precision: 15
    t.string   "prorate_across_all_items",       limit: 1
    t.datetime "accounting_date",                                           null: false
    t.string   "period_name",                    limit: 15
    t.string   "deferred_acctg_flag",            limit: 1
    t.datetime "def_acctg_start_date"
    t.datetime "def_acctg_end_date"
    t.decimal  "def_acctg_number_of_periods"
    t.string   "def_acctg_period_type",          limit: 30
    t.integer  "set_of_books_id",                limit: nil,                null: false
    t.decimal  "amount",                                                    null: false
    t.decimal  "base_amount"
    t.decimal  "rounding_amt"
    t.decimal  "quantity_invoiced"
    t.string   "unit_meas_lookup_code",          limit: 25
    t.decimal  "unit_price"
    t.string   "wfapproval_status",              limit: 30,                 null: false
    t.string   "ussgl_transaction_code",         limit: 30
    t.string   "discarded_flag",                 limit: 1
    t.decimal  "original_amount"
    t.decimal  "original_base_amount"
    t.decimal  "original_rounding_amt"
    t.string   "cancelled_flag",                 limit: 1
    t.string   "income_tax_region",              limit: 10
    t.string   "type_1099",                      limit: 10
    t.decimal  "stat_amount"
    t.integer  "prepay_invoice_id",              limit: nil
    t.decimal  "prepay_line_number"
    t.string   "invoice_includes_prepay_flag",   limit: 1
    t.integer  "corrected_inv_id",               limit: nil
    t.decimal  "corrected_line_number"
    t.integer  "po_header_id",                   limit: nil
    t.integer  "po_line_id",                     limit: nil
    t.integer  "po_release_id",                  limit: nil
    t.integer  "po_line_location_id",            limit: nil
    t.integer  "po_distribution_id",             limit: nil
    t.integer  "rcv_transaction_id",             limit: nil
    t.string   "final_match_flag",               limit: 1
    t.string   "assets_tracking_flag",           limit: 1
    t.string   "asset_book_type_code",           limit: 15
    t.integer  "asset_category_id",              limit: nil
    t.integer  "project_id",                     limit: nil
    t.integer  "task_id",                        limit: nil
    t.string   "expenditure_type",               limit: 30
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",    limit: nil
    t.decimal  "pa_quantity"
    t.integer  "pa_cc_ar_invoice_id",            limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",      limit: 15,  precision: 15
    t.string   "pa_cc_processed_code",           limit: 1
    t.integer  "award_id",                       limit: nil
    t.integer  "awt_group_id",                   limit: nil
    t.string   "reference_1",                    limit: 30
    t.string   "reference_2",                    limit: 30
    t.string   "receipt_verified_flag",          limit: 1
    t.string   "receipt_required_flag",          limit: 1
    t.string   "receipt_missing_flag",           limit: 1
    t.string   "justification",                  limit: 240
    t.string   "expense_group",                  limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",          limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",               limit: nil
    t.string   "adjustment_reason",              limit: 240
    t.string   "merchant_document_number",       limit: 80
    t.string   "merchant_name",                  limit: 80
    t.string   "merchant_reference",             limit: 240
    t.string   "merchant_tax_reg_number",        limit: 80
    t.string   "merchant_taxpayer_id",           limit: 80
    t.string   "country_of_supply",              limit: 5
    t.integer  "credit_card_trx_id",             limit: nil
    t.integer  "company_prepaid_invoice_id",     limit: nil
    t.string   "cc_reversal_flag",               limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                     limit: 15,  precision: 15
    t.integer  "last_updated_by",                limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                                          null: false
    t.integer  "last_update_login",              limit: 15,  precision: 15
    t.integer  "program_application_id",         limit: nil
    t.integer  "program_id",                     limit: nil
    t.datetime "program_update_date"
    t.integer  "request_id",                     limit: nil
    t.string   "attribute_category",             limit: 150
    t.string   "attribute1",                     limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.string   "line_selected_for_appl_flag",    limit: 1
    t.integer  "prepay_appl_request_id",         limit: nil
    t.integer  "application_id",                 limit: nil
    t.string   "product_table",                  limit: 30
    t.string   "reference_key1",                 limit: 150
    t.string   "reference_key2",                 limit: 150
    t.string   "reference_key3",                 limit: 150
    t.string   "reference_key4",                 limit: 150
    t.string   "reference_key5",                 limit: 150
    t.integer  "purchasing_category_id",         limit: nil
    t.integer  "cost_factor_id",                 limit: nil
    t.decimal  "control_amount"
    t.decimal  "assessable_value"
    t.decimal  "total_rec_tax_amount"
    t.decimal  "total_nrec_tax_amount"
    t.decimal  "total_rec_tax_amt_funcl_curr"
    t.decimal  "total_nrec_tax_amt_funcl_curr"
    t.decimal  "included_tax_amount"
    t.string   "primary_intended_use",           limit: 30
    t.string   "tax_already_calculated_flag",    limit: 1
    t.integer  "ship_to_location_id",            limit: nil
    t.string   "product_type",                   limit: 240
    t.string   "product_category",               limit: 240
    t.string   "product_fisc_classification",    limit: 240
    t.string   "user_defined_fisc_class",        limit: 240
    t.string   "trx_business_category",          limit: 240
    t.integer  "summary_tax_line_id",            limit: nil
    t.string   "tax_regime_code",                limit: 30
    t.string   "tax",                            limit: 30
    t.string   "tax_jurisdiction_code",          limit: 30
    t.string   "tax_status_code",                limit: 30
    t.integer  "tax_rate_id",                    limit: nil
    t.string   "tax_rate_code",                  limit: 150
    t.decimal  "tax_rate"
    t.integer  "tax_code_id",                    limit: nil
    t.string   "historical_flag",                limit: 1
    t.string   "tax_classification_code",        limit: 30
    t.integer  "source_application_id",          limit: nil
    t.string   "source_event_class_code",        limit: 30
    t.string   "source_entity_code",             limit: 30
    t.integer  "source_trx_id",                  limit: nil
    t.integer  "source_line_id",                 limit: nil
    t.string   "source_trx_level_type",          limit: 30
    t.decimal  "retained_amount"
    t.decimal  "retained_amount_remaining"
    t.integer  "retained_invoice_id",            limit: nil
    t.decimal  "retained_line_number"
    t.string   "line_selected_for_release_flag", limit: 1
    t.string   "line_owner_role",                limit: 320
    t.string   "disputable_flag",                limit: 1
    t.integer  "rcv_shipment_line_id",           limit: nil
    t.integer  "ail_invoice_id",                 limit: nil
    t.integer  "ail_distribution_line_number",   limit: 15,  precision: 15
    t.integer  "ail_invoice_id2",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number2",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id3",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number3",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id4",                limit: 15,  precision: 15
    t.integer  "pay_awt_group_id",               limit: nil
  end

  create_table "ap_invoice_lines_all20160729", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                     limit: nil,                null: false
    t.decimal  "line_number",                                               null: false
    t.string   "line_type_lookup_code",          limit: 25,                 null: false
    t.integer  "requester_id",                   limit: nil
    t.string   "description",                    limit: 240
    t.string   "line_source",                    limit: 30
    t.integer  "org_id",                         limit: nil
    t.decimal  "line_group_number"
    t.integer  "inventory_item_id",              limit: nil
    t.string   "item_description",               limit: 240
    t.string   "serial_number",                  limit: 35
    t.string   "manufacturer",                   limit: 30
    t.string   "model_number",                   limit: 40
    t.string   "warranty_number",                limit: 15
    t.string   "generate_dists",                 limit: 1
    t.string   "match_type",                     limit: 25
    t.integer  "distribution_set_id",            limit: nil
    t.string   "account_segment",                limit: 25
    t.string   "balancing_segment",              limit: 25
    t.string   "cost_center_segment",            limit: 25
    t.string   "overlay_dist_code_concat",       limit: 250
    t.integer  "default_dist_ccid",              limit: 15,  precision: 15
    t.string   "prorate_across_all_items",       limit: 1
    t.datetime "accounting_date",                                           null: false
    t.string   "period_name",                    limit: 15
    t.string   "deferred_acctg_flag",            limit: 1
    t.datetime "def_acctg_start_date"
    t.datetime "def_acctg_end_date"
    t.decimal  "def_acctg_number_of_periods"
    t.string   "def_acctg_period_type",          limit: 30
    t.integer  "set_of_books_id",                limit: nil,                null: false
    t.decimal  "amount",                                                    null: false
    t.decimal  "base_amount"
    t.decimal  "rounding_amt"
    t.decimal  "quantity_invoiced"
    t.string   "unit_meas_lookup_code",          limit: 25
    t.decimal  "unit_price"
    t.string   "wfapproval_status",              limit: 30,                 null: false
    t.string   "ussgl_transaction_code",         limit: 30
    t.string   "discarded_flag",                 limit: 1
    t.decimal  "original_amount"
    t.decimal  "original_base_amount"
    t.decimal  "original_rounding_amt"
    t.string   "cancelled_flag",                 limit: 1
    t.string   "income_tax_region",              limit: 10
    t.string   "type_1099",                      limit: 10
    t.decimal  "stat_amount"
    t.integer  "prepay_invoice_id",              limit: nil
    t.decimal  "prepay_line_number"
    t.string   "invoice_includes_prepay_flag",   limit: 1
    t.integer  "corrected_inv_id",               limit: nil
    t.decimal  "corrected_line_number"
    t.integer  "po_header_id",                   limit: nil
    t.integer  "po_line_id",                     limit: nil
    t.integer  "po_release_id",                  limit: nil
    t.integer  "po_line_location_id",            limit: nil
    t.integer  "po_distribution_id",             limit: nil
    t.integer  "rcv_transaction_id",             limit: nil
    t.string   "final_match_flag",               limit: 1
    t.string   "assets_tracking_flag",           limit: 1
    t.string   "asset_book_type_code",           limit: 15
    t.integer  "asset_category_id",              limit: nil
    t.integer  "project_id",                     limit: nil
    t.integer  "task_id",                        limit: nil
    t.string   "expenditure_type",               limit: 30
    t.datetime "expenditure_item_date"
    t.integer  "expenditure_organization_id",    limit: nil
    t.decimal  "pa_quantity"
    t.integer  "pa_cc_ar_invoice_id",            limit: nil
    t.integer  "pa_cc_ar_invoice_line_num",      limit: 15,  precision: 15
    t.string   "pa_cc_processed_code",           limit: 1
    t.integer  "award_id",                       limit: nil
    t.integer  "awt_group_id",                   limit: nil
    t.string   "reference_1",                    limit: 30
    t.string   "reference_2",                    limit: 30
    t.string   "receipt_verified_flag",          limit: 1
    t.string   "receipt_required_flag",          limit: 1
    t.string   "receipt_missing_flag",           limit: 1
    t.string   "justification",                  limit: 240
    t.string   "expense_group",                  limit: 80
    t.datetime "start_expense_date"
    t.datetime "end_expense_date"
    t.string   "receipt_currency_code",          limit: 15
    t.decimal  "receipt_conversion_rate"
    t.decimal  "receipt_currency_amount"
    t.decimal  "daily_amount"
    t.integer  "web_parameter_id",               limit: nil
    t.string   "adjustment_reason",              limit: 240
    t.string   "merchant_document_number",       limit: 80
    t.string   "merchant_name",                  limit: 80
    t.string   "merchant_reference",             limit: 240
    t.string   "merchant_tax_reg_number",        limit: 80
    t.string   "merchant_taxpayer_id",           limit: 80
    t.string   "country_of_supply",              limit: 5
    t.integer  "credit_card_trx_id",             limit: nil
    t.integer  "company_prepaid_invoice_id",     limit: nil
    t.string   "cc_reversal_flag",               limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                     limit: 15,  precision: 15
    t.integer  "last_updated_by",                limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                                          null: false
    t.integer  "last_update_login",              limit: 15,  precision: 15
    t.integer  "program_application_id",         limit: nil
    t.integer  "program_id",                     limit: nil
    t.datetime "program_update_date"
    t.integer  "request_id",                     limit: nil
    t.string   "attribute_category",             limit: 150
    t.string   "attribute1",                     limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.string   "line_selected_for_appl_flag",    limit: 1
    t.integer  "prepay_appl_request_id",         limit: nil
    t.integer  "application_id",                 limit: nil
    t.string   "product_table",                  limit: 30
    t.string   "reference_key1",                 limit: 150
    t.string   "reference_key2",                 limit: 150
    t.string   "reference_key3",                 limit: 150
    t.string   "reference_key4",                 limit: 150
    t.string   "reference_key5",                 limit: 150
    t.integer  "purchasing_category_id",         limit: nil
    t.integer  "cost_factor_id",                 limit: nil
    t.decimal  "control_amount"
    t.decimal  "assessable_value"
    t.decimal  "total_rec_tax_amount"
    t.decimal  "total_nrec_tax_amount"
    t.decimal  "total_rec_tax_amt_funcl_curr"
    t.decimal  "total_nrec_tax_amt_funcl_curr"
    t.decimal  "included_tax_amount"
    t.string   "primary_intended_use",           limit: 30
    t.string   "tax_already_calculated_flag",    limit: 1
    t.integer  "ship_to_location_id",            limit: nil
    t.string   "product_type",                   limit: 240
    t.string   "product_category",               limit: 240
    t.string   "product_fisc_classification",    limit: 240
    t.string   "user_defined_fisc_class",        limit: 240
    t.string   "trx_business_category",          limit: 240
    t.integer  "summary_tax_line_id",            limit: nil
    t.string   "tax_regime_code",                limit: 30
    t.string   "tax",                            limit: 30
    t.string   "tax_jurisdiction_code",          limit: 30
    t.string   "tax_status_code",                limit: 30
    t.integer  "tax_rate_id",                    limit: nil
    t.string   "tax_rate_code",                  limit: 150
    t.decimal  "tax_rate"
    t.integer  "tax_code_id",                    limit: nil
    t.string   "historical_flag",                limit: 1
    t.string   "tax_classification_code",        limit: 30
    t.integer  "source_application_id",          limit: nil
    t.string   "source_event_class_code",        limit: 30
    t.string   "source_entity_code",             limit: 30
    t.integer  "source_trx_id",                  limit: nil
    t.integer  "source_line_id",                 limit: nil
    t.string   "source_trx_level_type",          limit: 30
    t.decimal  "retained_amount"
    t.decimal  "retained_amount_remaining"
    t.integer  "retained_invoice_id",            limit: nil
    t.decimal  "retained_line_number"
    t.string   "line_selected_for_release_flag", limit: 1
    t.string   "line_owner_role",                limit: 320
    t.string   "disputable_flag",                limit: 1
    t.integer  "rcv_shipment_line_id",           limit: nil
    t.integer  "ail_invoice_id",                 limit: nil
    t.integer  "ail_distribution_line_number",   limit: 15,  precision: 15
    t.integer  "ail_invoice_id2",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number2",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id3",                limit: 15,  precision: 15
    t.integer  "ail_distribution_line_number3",  limit: 15,  precision: 15
    t.integer  "ail_invoice_id4",                limit: 15,  precision: 15
    t.integer  "pay_awt_group_id",               limit: nil
  end

  create_table "ap_invoice_paym20160803", id: false, force: :cascade do |t|
    t.integer  "accounting_event_id",            limit: nil
    t.datetime "accounting_date",                                            null: false
    t.string   "accrual_posted_flag",            limit: 1
    t.decimal  "amount",                                                     null: false
    t.string   "cash_posted_flag",               limit: 1
    t.integer  "check_id",                       limit: nil,                 null: false
    t.integer  "invoice_id",                     limit: nil,                 null: false
    t.integer  "invoice_payment_id",             limit: nil,                 null: false
    t.integer  "last_updated_by",                limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                           null: false
    t.integer  "payment_num",                    limit: 15,   precision: 15, null: false
    t.string   "period_name",                    limit: 15,                  null: false
    t.string   "posted_flag",                    limit: 1,                   null: false
    t.integer  "set_of_books_id",                limit: nil,                 null: false
    t.integer  "accts_pay_code_combination_id",  limit: nil
    t.integer  "asset_code_combination_id",      limit: nil
    t.integer  "created_by",                     limit: 15,   precision: 15
    t.datetime "creation_date"
    t.integer  "last_update_login",              limit: 15,   precision: 15
    t.string   "bank_account_num",               limit: 30
    t.string   "bank_account_type",              limit: 25
    t.string   "bank_num",                       limit: 25
    t.decimal  "discount_lost"
    t.decimal  "discount_taken"
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",             limit: 30
    t.integer  "gain_code_combination_id",       limit: nil
    t.decimal  "invoice_base_amount"
    t.integer  "loss_code_combination_id",       limit: nil
    t.decimal  "payment_base_amount"
    t.string   "attribute1",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute_category",             limit: 150
    t.integer  "cash_je_batch_id",               limit: nil
    t.integer  "future_pay_code_combination_id", limit: nil
    t.string   "future_pay_posted_flag",         limit: 1
    t.integer  "je_batch_id",                    limit: nil
    t.integer  "electronic_transfer_id",         limit: nil
    t.string   "assets_addition_flag",           limit: 1
    t.string   "invoice_payment_type",           limit: 25
    t.integer  "other_invoice_id",               limit: nil
    t.integer  "org_id",                         limit: nil
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.integer  "external_bank_account_id",       limit: nil
    t.string   "mrc_exchange_date",              limit: 2000
    t.string   "mrc_exchange_rate",              limit: 2000
    t.string   "mrc_exchange_rate_type",         limit: 2000
    t.string   "mrc_gain_code_combination_id",   limit: 2000
    t.string   "mrc_invoice_base_amount",        limit: 2000
    t.string   "mrc_loss_code_combination_id",   limit: 2000
    t.string   "mrc_payment_base_amount",        limit: 2000
    t.string   "reversal_flag",                  limit: 1
    t.integer  "reversal_inv_pmt_id",            limit: nil
    t.string   "iban_number",                    limit: 40
    t.integer  "invoicing_party_id",             limit: nil
    t.integer  "invoicing_party_site_id",        limit: nil
    t.integer  "invoicing_vendor_site_id",       limit: nil
    t.string   "remit_to_supplier_name",         limit: 240
    t.integer  "remit_to_supplier_id",           limit: nil
    t.string   "remit_to_supplier_site",         limit: 240
    t.integer  "remit_to_supplier_site_id",      limit: nil
  end

  create_table "ap_invoice_payments_all170504", id: false, force: :cascade do |t|
    t.integer  "accounting_event_id",            limit: nil
    t.datetime "accounting_date",                                            null: false
    t.string   "accrual_posted_flag",            limit: 1
    t.decimal  "amount",                                                     null: false
    t.string   "cash_posted_flag",               limit: 1
    t.integer  "check_id",                       limit: nil,                 null: false
    t.integer  "invoice_id",                     limit: nil,                 null: false
    t.integer  "invoice_payment_id",             limit: nil,                 null: false
    t.integer  "last_updated_by",                limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                           null: false
    t.integer  "payment_num",                    limit: 15,   precision: 15, null: false
    t.string   "period_name",                    limit: 15,                  null: false
    t.string   "posted_flag",                    limit: 1,                   null: false
    t.integer  "set_of_books_id",                limit: nil,                 null: false
    t.integer  "accts_pay_code_combination_id",  limit: nil
    t.integer  "asset_code_combination_id",      limit: nil
    t.integer  "created_by",                     limit: 15,   precision: 15
    t.datetime "creation_date"
    t.integer  "last_update_login",              limit: 15,   precision: 15
    t.string   "bank_account_num",               limit: 30
    t.string   "bank_account_type",              limit: 25
    t.string   "bank_num",                       limit: 25
    t.decimal  "discount_lost"
    t.decimal  "discount_taken"
    t.datetime "exchange_date"
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",             limit: 30
    t.integer  "gain_code_combination_id",       limit: nil
    t.decimal  "invoice_base_amount"
    t.integer  "loss_code_combination_id",       limit: nil
    t.decimal  "payment_base_amount"
    t.string   "attribute1",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute_category",             limit: 150
    t.integer  "cash_je_batch_id",               limit: nil
    t.integer  "future_pay_code_combination_id", limit: nil
    t.string   "future_pay_posted_flag",         limit: 1
    t.integer  "je_batch_id",                    limit: nil
    t.integer  "electronic_transfer_id",         limit: nil
    t.string   "assets_addition_flag",           limit: 1
    t.string   "invoice_payment_type",           limit: 25
    t.integer  "other_invoice_id",               limit: nil
    t.integer  "org_id",                         limit: nil
    t.string   "global_attribute_category",      limit: 150
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.integer  "external_bank_account_id",       limit: nil
    t.string   "mrc_exchange_date",              limit: 2000
    t.string   "mrc_exchange_rate",              limit: 2000
    t.string   "mrc_exchange_rate_type",         limit: 2000
    t.string   "mrc_gain_code_combination_id",   limit: 2000
    t.string   "mrc_invoice_base_amount",        limit: 2000
    t.string   "mrc_loss_code_combination_id",   limit: 2000
    t.string   "mrc_payment_base_amount",        limit: 2000
    t.string   "reversal_flag",                  limit: 1
    t.integer  "reversal_inv_pmt_id",            limit: nil
    t.string   "iban_number",                    limit: 40
    t.integer  "invoicing_party_id",             limit: nil
    t.integer  "invoicing_party_site_id",        limit: nil
    t.integer  "invoicing_vendor_site_id",       limit: nil
    t.string   "remit_to_supplier_name",         limit: 240
    t.integer  "remit_to_supplier_id",           limit: nil
    t.string   "remit_to_supplier_site",         limit: 240
    t.integer  "remit_to_supplier_site_id",      limit: nil
  end

  create_table "ap_invoices_all170504", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.datetime "last_update_date",                                                    null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.integer  "vendor_id",                     limit: nil
    t.string   "invoice_num",                   limit: 50,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.string   "invoice_currency_code",         limit: 15,                            null: false
    t.string   "payment_currency_code",         limit: 15,                            null: false
    t.decimal  "payment_cross_rate",                                                  null: false
    t.decimal  "invoice_amount"
    t.integer  "vendor_site_id",                limit: nil
    t.decimal  "amount_paid"
    t.decimal  "discount_amount_taken"
    t.datetime "invoice_date"
    t.string   "source",                        limit: 25
    t.string   "invoice_type_lookup_code",      limit: 25
    t.string   "description",                   limit: 240
    t.integer  "batch_id",                      limit: nil
    t.decimal  "amount_applicable_to_discount"
    t.decimal  "tax_amount"
    t.integer  "terms_id",                      limit: nil
    t.datetime "terms_date"
    t.string   "payment_method_lookup_code",    limit: 25
    t.string   "pay_group_lookup_code",         limit: 25
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.string   "payment_status_flag",           limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.decimal  "base_amount"
    t.string   "vat_code",                      limit: 15
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "exclusive_payment_flag",        limit: 1
    t.integer  "po_header_id",                  limit: nil
    t.decimal  "freight_amount"
    t.datetime "goods_received_date"
    t.datetime "invoice_received_date"
    t.string   "voucher_num",                   limit: 50
    t.decimal  "approved_amount"
    t.integer  "recurring_payment_id",          limit: nil
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.datetime "exchange_date"
    t.datetime "earliest_settlement_date"
    t.decimal  "original_prepayment_amount"
    t.integer  "doc_sequence_id",               limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "doc_category_code",             limit: 30
    t.string   "attribute1",                    limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute_category",            limit: 150
    t.string   "approval_status",               limit: 25
    t.string   "approval_description",          limit: 240
    t.decimal  "invoice_distribution_total"
    t.string   "posting_status",                limit: 15
    t.string   "prepay_flag",                   limit: 1
    t.string   "authorized_by",                 limit: 25
    t.datetime "cancelled_date"
    t.integer  "cancelled_by",                  limit: 15,   precision: 15
    t.decimal  "cancelled_amount"
    t.decimal  "temp_cancelled_amount"
    t.string   "project_accounting_context",    limit: 30
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "expenditure_type",              limit: 30
    t.datetime "expenditure_item_date"
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.integer  "expenditure_organization_id",   limit: nil
    t.integer  "pa_default_dist_ccid",          limit: 15,   precision: 15
    t.decimal  "vendor_prepay_amount"
    t.decimal  "payment_amount_total"
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.decimal  "pre_withholding_amount"
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.string   "auto_tax_calc_flag",            limit: 1
    t.string   "payment_cross_rate_type",       limit: 30
    t.datetime "payment_cross_rate_date"
    t.decimal  "pay_curr_invoice_amount"
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.datetime "gl_date",                                                             null: false
    t.integer  "award_id",                      limit: nil
    t.integer  "paid_on_behalf_employee_id",    limit: nil
    t.decimal  "amt_due_ccard_company"
    t.decimal  "amt_due_employee"
    t.string   "approval_ready_flag",           limit: 1,                             null: false
    t.integer  "approval_iteration",            limit: 9,    precision: 9
    t.string   "wfapproval_status",             limit: 50,                            null: false
    t.integer  "requester_id",                  limit: nil
    t.integer  "validation_request_id",         limit: nil
    t.decimal  "validated_tax_amount"
    t.string   "quick_credit",                  limit: 1
    t.integer  "credited_invoice_id",           limit: nil
    t.integer  "distribution_set_id",           limit: nil
    t.integer  "application_id",                limit: nil
    t.string   "product_table",                 limit: 30
    t.string   "reference_key1",                limit: 150
    t.string   "reference_key2",                limit: 150
    t.string   "reference_key3",                limit: 150
    t.string   "reference_key4",                limit: 150
    t.string   "reference_key5",                limit: 150
    t.decimal  "total_tax_amount"
    t.decimal  "self_assessed_tax_amount"
    t.integer  "tax_related_invoice_id",        limit: nil
    t.string   "trx_business_category",         limit: 240
    t.string   "user_defined_fisc_class",       limit: 240
    t.string   "taxation_country",              limit: 30
    t.string   "document_sub_type",             limit: 150
    t.string   "supplier_tax_invoice_number",   limit: 150
    t.datetime "supplier_tax_invoice_date"
    t.decimal  "supplier_tax_exchange_rate"
    t.datetime "tax_invoice_recording_date"
    t.string   "tax_invoice_internal_seq",      limit: 150
    t.integer  "legal_entity_id",               limit: nil
    t.string   "historical_flag",               limit: 1
    t.string   "force_revalidation_flag",       limit: 1
    t.string   "bank_charge_bearer",            limit: 30
    t.string   "remittance_message1",           limit: 150
    t.string   "remittance_message2",           limit: 150
    t.string   "remittance_message3",           limit: 150
    t.string   "unique_remittance_identifier",  limit: 30
    t.string   "uri_check_digit",               limit: 2
    t.string   "settlement_priority",           limit: 30
    t.string   "payment_reason_code",           limit: 30
    t.string   "payment_reason_comments",       limit: 240
    t.string   "payment_method_code",           limit: 30
    t.string   "delivery_channel_code",         limit: 30
    t.integer  "quick_po_header_id",            limit: nil
    t.string   "net_of_retainage_flag",         limit: 1
    t.decimal  "release_amount_net_of_tax"
    t.decimal  "control_amount"
    t.integer  "party_id",                      limit: nil
    t.integer  "party_site_id",                 limit: nil
    t.string   "pay_proc_trxn_type_code",       limit: 30
    t.string   "payment_function",              limit: 30
    t.string   "cust_registration_code",        limit: 50
    t.string   "cust_registration_number",      limit: 30
    t.string   "port_of_entry_code",            limit: 30
    t.integer  "external_bank_account_id",      limit: nil
    t.integer  "vendor_contact_id",             limit: nil
    t.string   "internal_contact_email",        limit: 2000
    t.string   "disc_is_inv_less_tax_flag",     limit: 1
    t.string   "exclude_freight_from_discount", limit: 1
    t.integer  "pay_awt_group_id",              limit: nil
    t.decimal  "original_invoice_amount"
    t.string   "dispute_reason",                limit: 100
    t.string   "remit_to_supplier_name",        limit: 240
    t.integer  "remit_to_supplier_id",          limit: nil
    t.string   "remit_to_supplier_site",        limit: 240
    t.integer  "remit_to_supplier_site_id",     limit: nil
    t.integer  "relationship_id",               limit: nil
  end

  create_table "ap_invoices_all20150908", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.datetime "last_update_date",                                                    null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.integer  "vendor_id",                     limit: nil
    t.string   "invoice_num",                   limit: 50,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.string   "invoice_currency_code",         limit: 15,                            null: false
    t.string   "payment_currency_code",         limit: 15,                            null: false
    t.decimal  "payment_cross_rate",                                                  null: false
    t.decimal  "invoice_amount"
    t.integer  "vendor_site_id",                limit: nil
    t.decimal  "amount_paid"
    t.decimal  "discount_amount_taken"
    t.datetime "invoice_date"
    t.string   "source",                        limit: 25
    t.string   "invoice_type_lookup_code",      limit: 25
    t.string   "description",                   limit: 240
    t.integer  "batch_id",                      limit: nil
    t.decimal  "amount_applicable_to_discount"
    t.decimal  "tax_amount"
    t.integer  "terms_id",                      limit: nil
    t.datetime "terms_date"
    t.string   "payment_method_lookup_code",    limit: 25
    t.string   "pay_group_lookup_code",         limit: 25
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.string   "payment_status_flag",           limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.decimal  "base_amount"
    t.string   "vat_code",                      limit: 15
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "exclusive_payment_flag",        limit: 1
    t.integer  "po_header_id",                  limit: nil
    t.decimal  "freight_amount"
    t.datetime "goods_received_date"
    t.datetime "invoice_received_date"
    t.string   "voucher_num",                   limit: 50
    t.decimal  "approved_amount"
    t.integer  "recurring_payment_id",          limit: nil
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.datetime "exchange_date"
    t.datetime "earliest_settlement_date"
    t.decimal  "original_prepayment_amount"
    t.integer  "doc_sequence_id",               limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "doc_category_code",             limit: 30
    t.string   "attribute1",                    limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute_category",            limit: 150
    t.string   "approval_status",               limit: 25
    t.string   "approval_description",          limit: 240
    t.decimal  "invoice_distribution_total"
    t.string   "posting_status",                limit: 15
    t.string   "prepay_flag",                   limit: 1
    t.string   "authorized_by",                 limit: 25
    t.datetime "cancelled_date"
    t.integer  "cancelled_by",                  limit: 15,   precision: 15
    t.decimal  "cancelled_amount"
    t.decimal  "temp_cancelled_amount"
    t.string   "project_accounting_context",    limit: 30
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "expenditure_type",              limit: 30
    t.datetime "expenditure_item_date"
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.integer  "expenditure_organization_id",   limit: nil
    t.integer  "pa_default_dist_ccid",          limit: 15,   precision: 15
    t.decimal  "vendor_prepay_amount"
    t.decimal  "payment_amount_total"
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.decimal  "pre_withholding_amount"
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.string   "auto_tax_calc_flag",            limit: 1
    t.string   "payment_cross_rate_type",       limit: 30
    t.datetime "payment_cross_rate_date"
    t.decimal  "pay_curr_invoice_amount"
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.datetime "gl_date",                                                             null: false
    t.integer  "award_id",                      limit: nil
    t.integer  "paid_on_behalf_employee_id",    limit: nil
    t.decimal  "amt_due_ccard_company"
    t.decimal  "amt_due_employee"
    t.string   "approval_ready_flag",           limit: 1,                             null: false
    t.integer  "approval_iteration",            limit: 9,    precision: 9
    t.string   "wfapproval_status",             limit: 50,                            null: false
    t.integer  "requester_id",                  limit: nil
    t.integer  "validation_request_id",         limit: nil
    t.decimal  "validated_tax_amount"
    t.string   "quick_credit",                  limit: 1
    t.integer  "credited_invoice_id",           limit: nil
    t.integer  "distribution_set_id",           limit: nil
    t.integer  "application_id",                limit: nil
    t.string   "product_table",                 limit: 30
    t.string   "reference_key1",                limit: 150
    t.string   "reference_key2",                limit: 150
    t.string   "reference_key3",                limit: 150
    t.string   "reference_key4",                limit: 150
    t.string   "reference_key5",                limit: 150
    t.decimal  "total_tax_amount"
    t.decimal  "self_assessed_tax_amount"
    t.integer  "tax_related_invoice_id",        limit: nil
    t.string   "trx_business_category",         limit: 240
    t.string   "user_defined_fisc_class",       limit: 240
    t.string   "taxation_country",              limit: 30
    t.string   "document_sub_type",             limit: 150
    t.string   "supplier_tax_invoice_number",   limit: 150
    t.datetime "supplier_tax_invoice_date"
    t.decimal  "supplier_tax_exchange_rate"
    t.datetime "tax_invoice_recording_date"
    t.string   "tax_invoice_internal_seq",      limit: 150
    t.integer  "legal_entity_id",               limit: nil
    t.string   "historical_flag",               limit: 1
    t.string   "force_revalidation_flag",       limit: 1
    t.string   "bank_charge_bearer",            limit: 30
    t.string   "remittance_message1",           limit: 150
    t.string   "remittance_message2",           limit: 150
    t.string   "remittance_message3",           limit: 150
    t.string   "unique_remittance_identifier",  limit: 30
    t.string   "uri_check_digit",               limit: 2
    t.string   "settlement_priority",           limit: 30
    t.string   "payment_reason_code",           limit: 30
    t.string   "payment_reason_comments",       limit: 240
    t.string   "payment_method_code",           limit: 30
    t.string   "delivery_channel_code",         limit: 30
    t.integer  "quick_po_header_id",            limit: nil
    t.string   "net_of_retainage_flag",         limit: 1
    t.decimal  "release_amount_net_of_tax"
    t.decimal  "control_amount"
    t.integer  "party_id",                      limit: nil
    t.integer  "party_site_id",                 limit: nil
    t.string   "pay_proc_trxn_type_code",       limit: 30
    t.string   "payment_function",              limit: 30
    t.string   "cust_registration_code",        limit: 50
    t.string   "cust_registration_number",      limit: 30
    t.string   "port_of_entry_code",            limit: 30
    t.integer  "external_bank_account_id",      limit: nil
    t.integer  "vendor_contact_id",             limit: nil
    t.string   "internal_contact_email",        limit: 2000
    t.string   "disc_is_inv_less_tax_flag",     limit: 1
    t.string   "exclude_freight_from_discount", limit: 1
    t.integer  "pay_awt_group_id",              limit: nil
    t.decimal  "original_invoice_amount"
    t.string   "dispute_reason",                limit: 100
    t.string   "remit_to_supplier_name",        limit: 240
    t.integer  "remit_to_supplier_id",          limit: nil
    t.string   "remit_to_supplier_site",        limit: 240
    t.integer  "remit_to_supplier_site_id",     limit: nil
    t.integer  "relationship_id",               limit: nil
  end

  create_table "ap_invoices_all20151102", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.datetime "last_update_date",                                                    null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.integer  "vendor_id",                     limit: nil
    t.string   "invoice_num",                   limit: 50,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.string   "invoice_currency_code",         limit: 15,                            null: false
    t.string   "payment_currency_code",         limit: 15,                            null: false
    t.decimal  "payment_cross_rate",                                                  null: false
    t.decimal  "invoice_amount"
    t.integer  "vendor_site_id",                limit: nil
    t.decimal  "amount_paid"
    t.decimal  "discount_amount_taken"
    t.datetime "invoice_date"
    t.string   "source",                        limit: 25
    t.string   "invoice_type_lookup_code",      limit: 25
    t.string   "description",                   limit: 240
    t.integer  "batch_id",                      limit: nil
    t.decimal  "amount_applicable_to_discount"
    t.decimal  "tax_amount"
    t.integer  "terms_id",                      limit: nil
    t.datetime "terms_date"
    t.string   "payment_method_lookup_code",    limit: 25
    t.string   "pay_group_lookup_code",         limit: 25
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.string   "payment_status_flag",           limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.decimal  "base_amount"
    t.string   "vat_code",                      limit: 15
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "exclusive_payment_flag",        limit: 1
    t.integer  "po_header_id",                  limit: nil
    t.decimal  "freight_amount"
    t.datetime "goods_received_date"
    t.datetime "invoice_received_date"
    t.string   "voucher_num",                   limit: 50
    t.decimal  "approved_amount"
    t.integer  "recurring_payment_id",          limit: nil
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.datetime "exchange_date"
    t.datetime "earliest_settlement_date"
    t.decimal  "original_prepayment_amount"
    t.integer  "doc_sequence_id",               limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "doc_category_code",             limit: 30
    t.string   "attribute1",                    limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute_category",            limit: 150
    t.string   "approval_status",               limit: 25
    t.string   "approval_description",          limit: 240
    t.decimal  "invoice_distribution_total"
    t.string   "posting_status",                limit: 15
    t.string   "prepay_flag",                   limit: 1
    t.string   "authorized_by",                 limit: 25
    t.datetime "cancelled_date"
    t.integer  "cancelled_by",                  limit: 15,   precision: 15
    t.decimal  "cancelled_amount"
    t.decimal  "temp_cancelled_amount"
    t.string   "project_accounting_context",    limit: 30
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "expenditure_type",              limit: 30
    t.datetime "expenditure_item_date"
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.integer  "expenditure_organization_id",   limit: nil
    t.integer  "pa_default_dist_ccid",          limit: 15,   precision: 15
    t.decimal  "vendor_prepay_amount"
    t.decimal  "payment_amount_total"
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.decimal  "pre_withholding_amount"
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.string   "auto_tax_calc_flag",            limit: 1
    t.string   "payment_cross_rate_type",       limit: 30
    t.datetime "payment_cross_rate_date"
    t.decimal  "pay_curr_invoice_amount"
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.datetime "gl_date",                                                             null: false
    t.integer  "award_id",                      limit: nil
    t.integer  "paid_on_behalf_employee_id",    limit: nil
    t.decimal  "amt_due_ccard_company"
    t.decimal  "amt_due_employee"
    t.string   "approval_ready_flag",           limit: 1,                             null: false
    t.integer  "approval_iteration",            limit: 9,    precision: 9
    t.string   "wfapproval_status",             limit: 50,                            null: false
    t.integer  "requester_id",                  limit: nil
    t.integer  "validation_request_id",         limit: nil
    t.decimal  "validated_tax_amount"
    t.string   "quick_credit",                  limit: 1
    t.integer  "credited_invoice_id",           limit: nil
    t.integer  "distribution_set_id",           limit: nil
    t.integer  "application_id",                limit: nil
    t.string   "product_table",                 limit: 30
    t.string   "reference_key1",                limit: 150
    t.string   "reference_key2",                limit: 150
    t.string   "reference_key3",                limit: 150
    t.string   "reference_key4",                limit: 150
    t.string   "reference_key5",                limit: 150
    t.decimal  "total_tax_amount"
    t.decimal  "self_assessed_tax_amount"
    t.integer  "tax_related_invoice_id",        limit: nil
    t.string   "trx_business_category",         limit: 240
    t.string   "user_defined_fisc_class",       limit: 240
    t.string   "taxation_country",              limit: 30
    t.string   "document_sub_type",             limit: 150
    t.string   "supplier_tax_invoice_number",   limit: 150
    t.datetime "supplier_tax_invoice_date"
    t.decimal  "supplier_tax_exchange_rate"
    t.datetime "tax_invoice_recording_date"
    t.string   "tax_invoice_internal_seq",      limit: 150
    t.integer  "legal_entity_id",               limit: nil
    t.string   "historical_flag",               limit: 1
    t.string   "force_revalidation_flag",       limit: 1
    t.string   "bank_charge_bearer",            limit: 30
    t.string   "remittance_message1",           limit: 150
    t.string   "remittance_message2",           limit: 150
    t.string   "remittance_message3",           limit: 150
    t.string   "unique_remittance_identifier",  limit: 30
    t.string   "uri_check_digit",               limit: 2
    t.string   "settlement_priority",           limit: 30
    t.string   "payment_reason_code",           limit: 30
    t.string   "payment_reason_comments",       limit: 240
    t.string   "payment_method_code",           limit: 30
    t.string   "delivery_channel_code",         limit: 30
    t.integer  "quick_po_header_id",            limit: nil
    t.string   "net_of_retainage_flag",         limit: 1
    t.decimal  "release_amount_net_of_tax"
    t.decimal  "control_amount"
    t.integer  "party_id",                      limit: nil
    t.integer  "party_site_id",                 limit: nil
    t.string   "pay_proc_trxn_type_code",       limit: 30
    t.string   "payment_function",              limit: 30
    t.string   "cust_registration_code",        limit: 50
    t.string   "cust_registration_number",      limit: 30
    t.string   "port_of_entry_code",            limit: 30
    t.integer  "external_bank_account_id",      limit: nil
    t.integer  "vendor_contact_id",             limit: nil
    t.string   "internal_contact_email",        limit: 2000
    t.string   "disc_is_inv_less_tax_flag",     limit: 1
    t.string   "exclude_freight_from_discount", limit: 1
    t.integer  "pay_awt_group_id",              limit: nil
    t.decimal  "original_invoice_amount"
    t.string   "dispute_reason",                limit: 100
    t.string   "remit_to_supplier_name",        limit: 240
    t.integer  "remit_to_supplier_id",          limit: nil
    t.string   "remit_to_supplier_site",        limit: 240
    t.integer  "remit_to_supplier_site_id",     limit: nil
    t.integer  "relationship_id",               limit: nil
  end

  create_table "ap_invoices_all20160729", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.datetime "last_update_date",                                                    null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.integer  "vendor_id",                     limit: nil
    t.string   "invoice_num",                   limit: 50,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.string   "invoice_currency_code",         limit: 15,                            null: false
    t.string   "payment_currency_code",         limit: 15,                            null: false
    t.decimal  "payment_cross_rate",                                                  null: false
    t.decimal  "invoice_amount"
    t.integer  "vendor_site_id",                limit: nil
    t.decimal  "amount_paid"
    t.decimal  "discount_amount_taken"
    t.datetime "invoice_date"
    t.string   "source",                        limit: 25
    t.string   "invoice_type_lookup_code",      limit: 25
    t.string   "description",                   limit: 240
    t.integer  "batch_id",                      limit: nil
    t.decimal  "amount_applicable_to_discount"
    t.decimal  "tax_amount"
    t.integer  "terms_id",                      limit: nil
    t.datetime "terms_date"
    t.string   "payment_method_lookup_code",    limit: 25
    t.string   "pay_group_lookup_code",         limit: 25
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.string   "payment_status_flag",           limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.decimal  "base_amount"
    t.string   "vat_code",                      limit: 15
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "exclusive_payment_flag",        limit: 1
    t.integer  "po_header_id",                  limit: nil
    t.decimal  "freight_amount"
    t.datetime "goods_received_date"
    t.datetime "invoice_received_date"
    t.string   "voucher_num",                   limit: 50
    t.decimal  "approved_amount"
    t.integer  "recurring_payment_id",          limit: nil
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.datetime "exchange_date"
    t.datetime "earliest_settlement_date"
    t.decimal  "original_prepayment_amount"
    t.integer  "doc_sequence_id",               limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "doc_category_code",             limit: 30
    t.string   "attribute1",                    limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute_category",            limit: 150
    t.string   "approval_status",               limit: 25
    t.string   "approval_description",          limit: 240
    t.decimal  "invoice_distribution_total"
    t.string   "posting_status",                limit: 15
    t.string   "prepay_flag",                   limit: 1
    t.string   "authorized_by",                 limit: 25
    t.datetime "cancelled_date"
    t.integer  "cancelled_by",                  limit: 15,   precision: 15
    t.decimal  "cancelled_amount"
    t.decimal  "temp_cancelled_amount"
    t.string   "project_accounting_context",    limit: 30
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "expenditure_type",              limit: 30
    t.datetime "expenditure_item_date"
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.integer  "expenditure_organization_id",   limit: nil
    t.integer  "pa_default_dist_ccid",          limit: 15,   precision: 15
    t.decimal  "vendor_prepay_amount"
    t.decimal  "payment_amount_total"
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.decimal  "pre_withholding_amount"
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.string   "auto_tax_calc_flag",            limit: 1
    t.string   "payment_cross_rate_type",       limit: 30
    t.datetime "payment_cross_rate_date"
    t.decimal  "pay_curr_invoice_amount"
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.datetime "gl_date",                                                             null: false
    t.integer  "award_id",                      limit: nil
    t.integer  "paid_on_behalf_employee_id",    limit: nil
    t.decimal  "amt_due_ccard_company"
    t.decimal  "amt_due_employee"
    t.string   "approval_ready_flag",           limit: 1,                             null: false
    t.integer  "approval_iteration",            limit: 9,    precision: 9
    t.string   "wfapproval_status",             limit: 50,                            null: false
    t.integer  "requester_id",                  limit: nil
    t.integer  "validation_request_id",         limit: nil
    t.decimal  "validated_tax_amount"
    t.string   "quick_credit",                  limit: 1
    t.integer  "credited_invoice_id",           limit: nil
    t.integer  "distribution_set_id",           limit: nil
    t.integer  "application_id",                limit: nil
    t.string   "product_table",                 limit: 30
    t.string   "reference_key1",                limit: 150
    t.string   "reference_key2",                limit: 150
    t.string   "reference_key3",                limit: 150
    t.string   "reference_key4",                limit: 150
    t.string   "reference_key5",                limit: 150
    t.decimal  "total_tax_amount"
    t.decimal  "self_assessed_tax_amount"
    t.integer  "tax_related_invoice_id",        limit: nil
    t.string   "trx_business_category",         limit: 240
    t.string   "user_defined_fisc_class",       limit: 240
    t.string   "taxation_country",              limit: 30
    t.string   "document_sub_type",             limit: 150
    t.string   "supplier_tax_invoice_number",   limit: 150
    t.datetime "supplier_tax_invoice_date"
    t.decimal  "supplier_tax_exchange_rate"
    t.datetime "tax_invoice_recording_date"
    t.string   "tax_invoice_internal_seq",      limit: 150
    t.integer  "legal_entity_id",               limit: nil
    t.string   "historical_flag",               limit: 1
    t.string   "force_revalidation_flag",       limit: 1
    t.string   "bank_charge_bearer",            limit: 30
    t.string   "remittance_message1",           limit: 150
    t.string   "remittance_message2",           limit: 150
    t.string   "remittance_message3",           limit: 150
    t.string   "unique_remittance_identifier",  limit: 30
    t.string   "uri_check_digit",               limit: 2
    t.string   "settlement_priority",           limit: 30
    t.string   "payment_reason_code",           limit: 30
    t.string   "payment_reason_comments",       limit: 240
    t.string   "payment_method_code",           limit: 30
    t.string   "delivery_channel_code",         limit: 30
    t.integer  "quick_po_header_id",            limit: nil
    t.string   "net_of_retainage_flag",         limit: 1
    t.decimal  "release_amount_net_of_tax"
    t.decimal  "control_amount"
    t.integer  "party_id",                      limit: nil
    t.integer  "party_site_id",                 limit: nil
    t.string   "pay_proc_trxn_type_code",       limit: 30
    t.string   "payment_function",              limit: 30
    t.string   "cust_registration_code",        limit: 50
    t.string   "cust_registration_number",      limit: 30
    t.string   "port_of_entry_code",            limit: 30
    t.integer  "external_bank_account_id",      limit: nil
    t.integer  "vendor_contact_id",             limit: nil
    t.string   "internal_contact_email",        limit: 2000
    t.string   "disc_is_inv_less_tax_flag",     limit: 1
    t.string   "exclude_freight_from_discount", limit: 1
    t.integer  "pay_awt_group_id",              limit: nil
    t.decimal  "original_invoice_amount"
    t.string   "dispute_reason",                limit: 100
    t.string   "remit_to_supplier_name",        limit: 240
    t.integer  "remit_to_supplier_id",          limit: nil
    t.string   "remit_to_supplier_site",        limit: 240
    t.integer  "remit_to_supplier_site_id",     limit: nil
    t.integer  "relationship_id",               limit: nil
  end

  create_table "ap_invoices_all829", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.datetime "last_update_date",                                                    null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.integer  "vendor_id",                     limit: nil
    t.string   "invoice_num",                   limit: 50,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.string   "invoice_currency_code",         limit: 15,                            null: false
    t.string   "payment_currency_code",         limit: 15,                            null: false
    t.decimal  "payment_cross_rate",                                                  null: false
    t.decimal  "invoice_amount"
    t.integer  "vendor_site_id",                limit: nil
    t.decimal  "amount_paid"
    t.decimal  "discount_amount_taken"
    t.datetime "invoice_date"
    t.string   "source",                        limit: 25
    t.string   "invoice_type_lookup_code",      limit: 25
    t.string   "description",                   limit: 240
    t.integer  "batch_id",                      limit: nil
    t.decimal  "amount_applicable_to_discount"
    t.decimal  "tax_amount"
    t.integer  "terms_id",                      limit: nil
    t.datetime "terms_date"
    t.string   "payment_method_lookup_code",    limit: 25
    t.string   "pay_group_lookup_code",         limit: 25
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.string   "payment_status_flag",           limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.decimal  "base_amount"
    t.string   "vat_code",                      limit: 15
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "exclusive_payment_flag",        limit: 1
    t.integer  "po_header_id",                  limit: nil
    t.decimal  "freight_amount"
    t.datetime "goods_received_date"
    t.datetime "invoice_received_date"
    t.string   "voucher_num",                   limit: 50
    t.decimal  "approved_amount"
    t.integer  "recurring_payment_id",          limit: nil
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.datetime "exchange_date"
    t.datetime "earliest_settlement_date"
    t.decimal  "original_prepayment_amount"
    t.integer  "doc_sequence_id",               limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "doc_category_code",             limit: 30
    t.string   "attribute1",                    limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute_category",            limit: 150
    t.string   "approval_status",               limit: 25
    t.string   "approval_description",          limit: 240
    t.decimal  "invoice_distribution_total"
    t.string   "posting_status",                limit: 15
    t.string   "prepay_flag",                   limit: 1
    t.string   "authorized_by",                 limit: 25
    t.datetime "cancelled_date"
    t.integer  "cancelled_by",                  limit: 15,   precision: 15
    t.decimal  "cancelled_amount"
    t.decimal  "temp_cancelled_amount"
    t.string   "project_accounting_context",    limit: 30
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "expenditure_type",              limit: 30
    t.datetime "expenditure_item_date"
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.integer  "expenditure_organization_id",   limit: nil
    t.integer  "pa_default_dist_ccid",          limit: 15,   precision: 15
    t.decimal  "vendor_prepay_amount"
    t.decimal  "payment_amount_total"
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.decimal  "pre_withholding_amount"
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.string   "auto_tax_calc_flag",            limit: 1
    t.string   "payment_cross_rate_type",       limit: 30
    t.datetime "payment_cross_rate_date"
    t.decimal  "pay_curr_invoice_amount"
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.datetime "gl_date",                                                             null: false
    t.integer  "award_id",                      limit: nil
    t.integer  "paid_on_behalf_employee_id",    limit: nil
    t.decimal  "amt_due_ccard_company"
    t.decimal  "amt_due_employee"
    t.string   "approval_ready_flag",           limit: 1,                             null: false
    t.integer  "approval_iteration",            limit: 9,    precision: 9
    t.string   "wfapproval_status",             limit: 50,                            null: false
    t.integer  "requester_id",                  limit: nil
    t.integer  "validation_request_id",         limit: nil
    t.decimal  "validated_tax_amount"
    t.string   "quick_credit",                  limit: 1
    t.integer  "credited_invoice_id",           limit: nil
    t.integer  "distribution_set_id",           limit: nil
    t.integer  "application_id",                limit: nil
    t.string   "product_table",                 limit: 30
    t.string   "reference_key1",                limit: 150
    t.string   "reference_key2",                limit: 150
    t.string   "reference_key3",                limit: 150
    t.string   "reference_key4",                limit: 150
    t.string   "reference_key5",                limit: 150
    t.decimal  "total_tax_amount"
    t.decimal  "self_assessed_tax_amount"
    t.integer  "tax_related_invoice_id",        limit: nil
    t.string   "trx_business_category",         limit: 240
    t.string   "user_defined_fisc_class",       limit: 240
    t.string   "taxation_country",              limit: 30
    t.string   "document_sub_type",             limit: 150
    t.string   "supplier_tax_invoice_number",   limit: 150
    t.datetime "supplier_tax_invoice_date"
    t.decimal  "supplier_tax_exchange_rate"
    t.datetime "tax_invoice_recording_date"
    t.string   "tax_invoice_internal_seq",      limit: 150
    t.integer  "legal_entity_id",               limit: nil
    t.string   "historical_flag",               limit: 1
    t.string   "force_revalidation_flag",       limit: 1
    t.string   "bank_charge_bearer",            limit: 30
    t.string   "remittance_message1",           limit: 150
    t.string   "remittance_message2",           limit: 150
    t.string   "remittance_message3",           limit: 150
    t.string   "unique_remittance_identifier",  limit: 30
    t.string   "uri_check_digit",               limit: 2
    t.string   "settlement_priority",           limit: 30
    t.string   "payment_reason_code",           limit: 30
    t.string   "payment_reason_comments",       limit: 240
    t.string   "payment_method_code",           limit: 30
    t.string   "delivery_channel_code",         limit: 30
    t.integer  "quick_po_header_id",            limit: nil
    t.string   "net_of_retainage_flag",         limit: 1
    t.decimal  "release_amount_net_of_tax"
    t.decimal  "control_amount"
    t.integer  "party_id",                      limit: nil
    t.integer  "party_site_id",                 limit: nil
    t.string   "pay_proc_trxn_type_code",       limit: 30
    t.string   "payment_function",              limit: 30
    t.string   "cust_registration_code",        limit: 50
    t.string   "cust_registration_number",      limit: 30
    t.string   "port_of_entry_code",            limit: 30
    t.integer  "external_bank_account_id",      limit: nil
    t.integer  "vendor_contact_id",             limit: nil
    t.string   "internal_contact_email",        limit: 2000
    t.string   "disc_is_inv_less_tax_flag",     limit: 1
    t.string   "exclude_freight_from_discount", limit: 1
    t.integer  "pay_awt_group_id",              limit: nil
    t.decimal  "original_invoice_amount"
    t.string   "dispute_reason",                limit: 100
    t.string   "remit_to_supplier_name",        limit: 240
    t.integer  "remit_to_supplier_id",          limit: nil
    t.string   "remit_to_supplier_site",        limit: 240
    t.integer  "remit_to_supplier_site_id",     limit: nil
    t.integer  "relationship_id",               limit: nil
  end

  create_table "ap_invoices_all_170222", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                    limit: nil,                           null: false
    t.datetime "last_update_date",                                                    null: false
    t.integer  "last_updated_by",               limit: 15,   precision: 15,           null: false
    t.integer  "vendor_id",                     limit: nil
    t.string   "invoice_num",                   limit: 50,                            null: false
    t.integer  "set_of_books_id",               limit: nil,                           null: false
    t.string   "invoice_currency_code",         limit: 15,                            null: false
    t.string   "payment_currency_code",         limit: 15,                            null: false
    t.decimal  "payment_cross_rate",                                                  null: false
    t.decimal  "invoice_amount"
    t.integer  "vendor_site_id",                limit: nil
    t.decimal  "amount_paid"
    t.decimal  "discount_amount_taken"
    t.datetime "invoice_date"
    t.string   "source",                        limit: 25
    t.string   "invoice_type_lookup_code",      limit: 25
    t.string   "description",                   limit: 240
    t.integer  "batch_id",                      limit: nil
    t.decimal  "amount_applicable_to_discount"
    t.decimal  "tax_amount"
    t.integer  "terms_id",                      limit: nil
    t.datetime "terms_date"
    t.string   "payment_method_lookup_code",    limit: 25
    t.string   "pay_group_lookup_code",         limit: 25
    t.integer  "accts_pay_code_combination_id", limit: nil
    t.string   "payment_status_flag",           limit: 1
    t.datetime "creation_date"
    t.integer  "created_by",                    limit: 15,   precision: 15
    t.decimal  "base_amount"
    t.string   "vat_code",                      limit: 15
    t.integer  "last_update_login",             limit: 15,   precision: 15
    t.string   "exclusive_payment_flag",        limit: 1
    t.integer  "po_header_id",                  limit: nil
    t.decimal  "freight_amount"
    t.datetime "goods_received_date"
    t.datetime "invoice_received_date"
    t.string   "voucher_num",                   limit: 50
    t.decimal  "approved_amount"
    t.integer  "recurring_payment_id",          limit: nil
    t.decimal  "exchange_rate"
    t.string   "exchange_rate_type",            limit: 30
    t.datetime "exchange_date"
    t.datetime "earliest_settlement_date"
    t.decimal  "original_prepayment_amount"
    t.integer  "doc_sequence_id",               limit: nil
    t.decimal  "doc_sequence_value"
    t.string   "doc_category_code",             limit: 30
    t.string   "attribute1",                    limit: 150
    t.string   "attribute2",                    limit: 150
    t.string   "attribute3",                    limit: 150
    t.string   "attribute4",                    limit: 150
    t.string   "attribute5",                    limit: 150
    t.string   "attribute6",                    limit: 150
    t.string   "attribute7",                    limit: 150
    t.string   "attribute8",                    limit: 150
    t.string   "attribute9",                    limit: 150
    t.string   "attribute10",                   limit: 150
    t.string   "attribute11",                   limit: 150
    t.string   "attribute12",                   limit: 150
    t.string   "attribute13",                   limit: 150
    t.string   "attribute14",                   limit: 150
    t.string   "attribute15",                   limit: 150
    t.string   "attribute_category",            limit: 150
    t.string   "approval_status",               limit: 25
    t.string   "approval_description",          limit: 240
    t.decimal  "invoice_distribution_total"
    t.string   "posting_status",                limit: 15
    t.string   "prepay_flag",                   limit: 1
    t.string   "authorized_by",                 limit: 25
    t.datetime "cancelled_date"
    t.integer  "cancelled_by",                  limit: 15,   precision: 15
    t.decimal  "cancelled_amount"
    t.decimal  "temp_cancelled_amount"
    t.string   "project_accounting_context",    limit: 30
    t.string   "ussgl_transaction_code",        limit: 30
    t.string   "ussgl_trx_code_context",        limit: 30
    t.integer  "project_id",                    limit: nil
    t.integer  "task_id",                       limit: nil
    t.string   "expenditure_type",              limit: 30
    t.datetime "expenditure_item_date"
    t.decimal  "pa_quantity",                                precision: 22, scale: 5
    t.integer  "expenditure_organization_id",   limit: nil
    t.integer  "pa_default_dist_ccid",          limit: 15,   precision: 15
    t.decimal  "vendor_prepay_amount"
    t.decimal  "payment_amount_total"
    t.string   "awt_flag",                      limit: 1
    t.integer  "awt_group_id",                  limit: nil
    t.string   "reference_1",                   limit: 30
    t.string   "reference_2",                   limit: 30
    t.integer  "org_id",                        limit: nil
    t.decimal  "pre_withholding_amount"
    t.string   "global_attribute_category",     limit: 150
    t.string   "global_attribute1",             limit: 150
    t.string   "global_attribute2",             limit: 150
    t.string   "global_attribute3",             limit: 150
    t.string   "global_attribute4",             limit: 150
    t.string   "global_attribute5",             limit: 150
    t.string   "global_attribute6",             limit: 150
    t.string   "global_attribute7",             limit: 150
    t.string   "global_attribute8",             limit: 150
    t.string   "global_attribute9",             limit: 150
    t.string   "global_attribute10",            limit: 150
    t.string   "global_attribute11",            limit: 150
    t.string   "global_attribute12",            limit: 150
    t.string   "global_attribute13",            limit: 150
    t.string   "global_attribute14",            limit: 150
    t.string   "global_attribute15",            limit: 150
    t.string   "global_attribute16",            limit: 150
    t.string   "global_attribute17",            limit: 150
    t.string   "global_attribute18",            limit: 150
    t.string   "global_attribute19",            limit: 150
    t.string   "global_attribute20",            limit: 150
    t.string   "auto_tax_calc_flag",            limit: 1
    t.string   "payment_cross_rate_type",       limit: 30
    t.datetime "payment_cross_rate_date"
    t.decimal  "pay_curr_invoice_amount"
    t.string   "mrc_base_amount",               limit: 2000
    t.string   "mrc_exchange_rate",             limit: 2000
    t.string   "mrc_exchange_rate_type",        limit: 2000
    t.string   "mrc_exchange_date",             limit: 2000
    t.datetime "gl_date",                                                             null: false
    t.integer  "award_id",                      limit: nil
    t.integer  "paid_on_behalf_employee_id",    limit: nil
    t.decimal  "amt_due_ccard_company"
    t.decimal  "amt_due_employee"
    t.string   "approval_ready_flag",           limit: 1,                             null: false
    t.integer  "approval_iteration",            limit: 9,    precision: 9
    t.string   "wfapproval_status",             limit: 50,                            null: false
    t.integer  "requester_id",                  limit: nil
    t.integer  "validation_request_id",         limit: nil
    t.decimal  "validated_tax_amount"
    t.string   "quick_credit",                  limit: 1
    t.integer  "credited_invoice_id",           limit: nil
    t.integer  "distribution_set_id",           limit: nil
    t.integer  "application_id",                limit: nil
    t.string   "product_table",                 limit: 30
    t.string   "reference_key1",                limit: 150
    t.string   "reference_key2",                limit: 150
    t.string   "reference_key3",                limit: 150
    t.string   "reference_key4",                limit: 150
    t.string   "reference_key5",                limit: 150
    t.decimal  "total_tax_amount"
    t.decimal  "self_assessed_tax_amount"
    t.integer  "tax_related_invoice_id",        limit: nil
    t.string   "trx_business_category",         limit: 240
    t.string   "user_defined_fisc_class",       limit: 240
    t.string   "taxation_country",              limit: 30
    t.string   "document_sub_type",             limit: 150
    t.string   "supplier_tax_invoice_number",   limit: 150
    t.datetime "supplier_tax_invoice_date"
    t.decimal  "supplier_tax_exchange_rate"
    t.datetime "tax_invoice_recording_date"
    t.string   "tax_invoice_internal_seq",      limit: 150
    t.integer  "legal_entity_id",               limit: nil
    t.string   "historical_flag",               limit: 1
    t.string   "force_revalidation_flag",       limit: 1
    t.string   "bank_charge_bearer",            limit: 30
    t.string   "remittance_message1",           limit: 150
    t.string   "remittance_message2",           limit: 150
    t.string   "remittance_message3",           limit: 150
    t.string   "unique_remittance_identifier",  limit: 30
    t.string   "uri_check_digit",               limit: 2
    t.string   "settlement_priority",           limit: 30
    t.string   "payment_reason_code",           limit: 30
    t.string   "payment_reason_comments",       limit: 240
    t.string   "payment_method_code",           limit: 30
    t.string   "delivery_channel_code",         limit: 30
    t.integer  "quick_po_header_id",            limit: nil
    t.string   "net_of_retainage_flag",         limit: 1
    t.decimal  "release_amount_net_of_tax"
    t.decimal  "control_amount"
    t.integer  "party_id",                      limit: nil
    t.integer  "party_site_id",                 limit: nil
    t.string   "pay_proc_trxn_type_code",       limit: 30
    t.string   "payment_function",              limit: 30
    t.string   "cust_registration_code",        limit: 50
    t.string   "cust_registration_number",      limit: 30
    t.string   "port_of_entry_code",            limit: 30
    t.integer  "external_bank_account_id",      limit: nil
    t.integer  "vendor_contact_id",             limit: nil
    t.string   "internal_contact_email",        limit: 2000
    t.string   "disc_is_inv_less_tax_flag",     limit: 1
    t.string   "exclude_freight_from_discount", limit: 1
    t.integer  "pay_awt_group_id",              limit: nil
    t.decimal  "original_invoice_amount"
    t.string   "dispute_reason",                limit: 100
    t.string   "remit_to_supplier_name",        limit: 240
    t.integer  "remit_to_supplier_id",          limit: nil
    t.string   "remit_to_supplier_site",        limit: 240
    t.integer  "remit_to_supplier_site_id",     limit: nil
    t.integer  "relationship_id",               limit: nil
  end

  create_table "ap_payment_history_all170504", id: false, force: :cascade do |t|
    t.integer  "payment_history_id",          limit: nil,                 null: false
    t.integer  "check_id",                    limit: nil,                 null: false
    t.datetime "accounting_date",                                         null: false
    t.string   "transaction_type",            limit: 30,                  null: false
    t.string   "posted_flag",                 limit: 1,                   null: false
    t.string   "matched_flag",                limit: 1
    t.integer  "accounting_event_id",         limit: nil
    t.integer  "org_id",                      limit: nil
    t.datetime "creation_date",                                           null: false
    t.integer  "created_by",                  limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                        null: false
    t.integer  "last_updated_by",             limit: 15,   precision: 15, null: false
    t.integer  "last_update_login",           limit: 15,   precision: 15
    t.datetime "program_update_date"
    t.integer  "program_application_id",      limit: nil
    t.integer  "program_id",                  limit: nil
    t.integer  "request_id",                  limit: nil
    t.integer  "rev_pmt_hist_id",             limit: nil
    t.decimal  "trx_bank_amount"
    t.decimal  "errors_bank_amount"
    t.decimal  "charges_bank_amount"
    t.decimal  "trx_pmt_amount",                                          null: false
    t.decimal  "errors_pmt_amount"
    t.decimal  "charges_pmt_amount"
    t.decimal  "trx_base_amount"
    t.decimal  "errors_base_amount"
    t.decimal  "charges_base_amount"
    t.string   "bank_currency_code",          limit: 15
    t.string   "bank_to_base_xrate_type",     limit: 30
    t.datetime "bank_to_base_xrate_date"
    t.decimal  "bank_to_base_xrate"
    t.string   "pmt_currency_code",           limit: 15,                  null: false
    t.string   "pmt_to_base_xrate_type",      limit: 30
    t.datetime "pmt_to_base_xrate_date"
    t.decimal  "pmt_to_base_xrate"
    t.string   "mrc_pmt_to_base_xrate_type",  limit: 2000
    t.string   "mrc_pmt_to_base_xrate_date",  limit: 2000
    t.string   "mrc_pmt_to_base_xrate",       limit: 2000
    t.string   "mrc_bank_to_base_xrate_type", limit: 2000
    t.string   "mrc_bank_to_base_xrate_date", limit: 2000
    t.string   "mrc_bank_to_base_xrate",      limit: 2000
    t.string   "mrc_trx_base_amount",         limit: 2000
    t.string   "mrc_errors_base_amount",      limit: 2000
    t.string   "mrc_charges_base_amount",     limit: 2000
    t.integer  "related_event_id",            limit: nil
    t.string   "historical_flag",             limit: 1
    t.integer  "invoice_adjustment_event_id", limit: nil
    t.string   "gain_loss_indicator",         limit: 1
  end

  create_table "ap_payment_sche20151102", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                 limit: nil,                 null: false
    t.integer  "last_updated_by",            limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                       null: false
    t.decimal  "payment_cross_rate",                                     null: false
    t.integer  "payment_num",                limit: 15,   precision: 15, null: false
    t.decimal  "amount_remaining"
    t.integer  "created_by",                 limit: 15,   precision: 15
    t.datetime "creation_date"
    t.datetime "discount_date"
    t.datetime "due_date"
    t.datetime "future_pay_due_date"
    t.decimal  "gross_amount"
    t.string   "hold_flag",                  limit: 1
    t.integer  "last_update_login",          limit: 15,   precision: 15
    t.string   "payment_method_lookup_code", limit: 25
    t.integer  "payment_priority",           limit: 2,    precision: 2
    t.string   "payment_status_flag",        limit: 25
    t.datetime "second_discount_date"
    t.datetime "third_discount_date"
    t.integer  "batch_id",                   limit: nil
    t.decimal  "discount_amount_available"
    t.decimal  "second_disc_amt_available"
    t.decimal  "third_disc_amt_available"
    t.string   "attribute1",                 limit: 150
    t.string   "attribute10",                limit: 150
    t.string   "attribute11",                limit: 150
    t.string   "attribute12",                limit: 150
    t.string   "attribute13",                limit: 150
    t.string   "attribute14",                limit: 150
    t.string   "attribute15",                limit: 150
    t.string   "attribute2",                 limit: 150
    t.string   "attribute3",                 limit: 150
    t.string   "attribute4",                 limit: 150
    t.string   "attribute5",                 limit: 150
    t.string   "attribute6",                 limit: 150
    t.string   "attribute7",                 limit: 150
    t.string   "attribute8",                 limit: 150
    t.string   "attribute9",                 limit: 150
    t.string   "attribute_category",         limit: 150
    t.decimal  "discount_amount_remaining"
    t.integer  "org_id",                     limit: nil
    t.string   "global_attribute_category",  limit: 150
    t.string   "global_attribute1",          limit: 150
    t.string   "global_attribute2",          limit: 150
    t.string   "global_attribute3",          limit: 150
    t.string   "global_attribute4",          limit: 150
    t.string   "global_attribute5",          limit: 150
    t.string   "global_attribute6",          limit: 150
    t.string   "global_attribute7",          limit: 150
    t.string   "global_attribute8",          limit: 150
    t.string   "global_attribute9",          limit: 150
    t.string   "global_attribute10",         limit: 150
    t.string   "global_attribute11",         limit: 150
    t.string   "global_attribute12",         limit: 150
    t.string   "global_attribute13",         limit: 150
    t.string   "global_attribute14",         limit: 150
    t.string   "global_attribute15",         limit: 150
    t.string   "global_attribute16",         limit: 150
    t.string   "global_attribute17",         limit: 150
    t.string   "global_attribute18",         limit: 150
    t.string   "global_attribute19",         limit: 150
    t.string   "global_attribute20",         limit: 150
    t.integer  "external_bank_account_id",   limit: nil
    t.decimal  "inv_curr_gross_amount"
    t.integer  "checkrun_id",                limit: nil
    t.string   "dbi_events_complete_flag",   limit: 1
    t.string   "iby_hold_reason",            limit: 2000
    t.string   "payment_method_code",        limit: 30
    t.string   "remittance_message1",        limit: 150
    t.string   "remittance_message2",        limit: 150
    t.string   "remittance_message3",        limit: 150
    t.string   "remit_to_supplier_name",     limit: 240
    t.integer  "remit_to_supplier_id",       limit: nil
    t.string   "remit_to_supplier_site",     limit: 240
    t.integer  "remit_to_supplier_site_id",  limit: nil
    t.integer  "relationship_id",            limit: nil
  end

  create_table "ap_payment_sched20150908", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                 limit: nil,                 null: false
    t.integer  "last_updated_by",            limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                       null: false
    t.decimal  "payment_cross_rate",                                     null: false
    t.integer  "payment_num",                limit: 15,   precision: 15, null: false
    t.decimal  "amount_remaining"
    t.integer  "created_by",                 limit: 15,   precision: 15
    t.datetime "creation_date"
    t.datetime "discount_date"
    t.datetime "due_date"
    t.datetime "future_pay_due_date"
    t.decimal  "gross_amount"
    t.string   "hold_flag",                  limit: 1
    t.integer  "last_update_login",          limit: 15,   precision: 15
    t.string   "payment_method_lookup_code", limit: 25
    t.integer  "payment_priority",           limit: 2,    precision: 2
    t.string   "payment_status_flag",        limit: 25
    t.datetime "second_discount_date"
    t.datetime "third_discount_date"
    t.integer  "batch_id",                   limit: nil
    t.decimal  "discount_amount_available"
    t.decimal  "second_disc_amt_available"
    t.decimal  "third_disc_amt_available"
    t.string   "attribute1",                 limit: 150
    t.string   "attribute10",                limit: 150
    t.string   "attribute11",                limit: 150
    t.string   "attribute12",                limit: 150
    t.string   "attribute13",                limit: 150
    t.string   "attribute14",                limit: 150
    t.string   "attribute15",                limit: 150
    t.string   "attribute2",                 limit: 150
    t.string   "attribute3",                 limit: 150
    t.string   "attribute4",                 limit: 150
    t.string   "attribute5",                 limit: 150
    t.string   "attribute6",                 limit: 150
    t.string   "attribute7",                 limit: 150
    t.string   "attribute8",                 limit: 150
    t.string   "attribute9",                 limit: 150
    t.string   "attribute_category",         limit: 150
    t.decimal  "discount_amount_remaining"
    t.integer  "org_id",                     limit: nil
    t.string   "global_attribute_category",  limit: 150
    t.string   "global_attribute1",          limit: 150
    t.string   "global_attribute2",          limit: 150
    t.string   "global_attribute3",          limit: 150
    t.string   "global_attribute4",          limit: 150
    t.string   "global_attribute5",          limit: 150
    t.string   "global_attribute6",          limit: 150
    t.string   "global_attribute7",          limit: 150
    t.string   "global_attribute8",          limit: 150
    t.string   "global_attribute9",          limit: 150
    t.string   "global_attribute10",         limit: 150
    t.string   "global_attribute11",         limit: 150
    t.string   "global_attribute12",         limit: 150
    t.string   "global_attribute13",         limit: 150
    t.string   "global_attribute14",         limit: 150
    t.string   "global_attribute15",         limit: 150
    t.string   "global_attribute16",         limit: 150
    t.string   "global_attribute17",         limit: 150
    t.string   "global_attribute18",         limit: 150
    t.string   "global_attribute19",         limit: 150
    t.string   "global_attribute20",         limit: 150
    t.integer  "external_bank_account_id",   limit: nil
    t.decimal  "inv_curr_gross_amount"
    t.integer  "checkrun_id",                limit: nil
    t.string   "dbi_events_complete_flag",   limit: 1
    t.string   "iby_hold_reason",            limit: 2000
    t.string   "payment_method_code",        limit: 30
    t.string   "remittance_message1",        limit: 150
    t.string   "remittance_message2",        limit: 150
    t.string   "remittance_message3",        limit: 150
    t.string   "remit_to_supplier_name",     limit: 240
    t.integer  "remit_to_supplier_id",       limit: nil
    t.string   "remit_to_supplier_site",     limit: 240
    t.integer  "remit_to_supplier_site_id",  limit: nil
    t.integer  "relationship_id",            limit: nil
  end

  create_table "ap_payment_sched20160729", id: false, force: :cascade do |t|
    t.integer  "invoice_id",                 limit: nil,                 null: false
    t.integer  "last_updated_by",            limit: 15,   precision: 15, null: false
    t.datetime "last_update_date",                                       null: false
    t.decimal  "payment_cross_rate",                                     null: false
    t.integer  "payment_num",                limit: 15,   precision: 15, null: false
    t.decimal  "amount_remaining"
    t.integer  "created_by",                 limit: 15,   precision: 15
    t.datetime "creation_date"
    t.datetime "discount_date"
    t.datetime "due_date"
    t.datetime "future_pay_due_date"
    t.decimal  "gross_amount"
    t.string   "hold_flag",                  limit: 1
    t.integer  "last_update_login",          limit: 15,   precision: 15
    t.string   "payment_method_lookup_code", limit: 25
    t.integer  "payment_priority",           limit: 2,    precision: 2
    t.string   "payment_status_flag",        limit: 25
    t.datetime "second_discount_date"
    t.datetime "third_discount_date"
    t.integer  "batch_id",                   limit: nil
    t.decimal  "discount_amount_available"
    t.decimal  "second_disc_amt_available"
    t.decimal  "third_disc_amt_available"
    t.string   "attribute1",                 limit: 150
    t.string   "attribute10",                limit: 150
    t.string   "attribute11",                limit: 150
    t.string   "attribute12",                limit: 150
    t.string   "attribute13",                limit: 150
    t.string   "attribute14",                limit: 150
    t.string   "attribute15",                limit: 150
    t.string   "attribute2",                 limit: 150
    t.string   "attribute3",                 limit: 150
    t.string   "attribute4",                 limit: 150
    t.string   "attribute5",                 limit: 150
    t.string   "attribute6",                 limit: 150
    t.string   "attribute7",                 limit: 150
    t.string   "attribute8",                 limit: 150
    t.string   "attribute9",                 limit: 150
    t.string   "attribute_category",         limit: 150
    t.decimal  "discount_amount_remaining"
    t.integer  "org_id",                     limit: nil
    t.string   "global_attribute_category",  limit: 150
    t.string   "global_attribute1",          limit: 150
    t.string   "global_attribute2",          limit: 150
    t.string   "global_attribute3",          limit: 150
    t.string   "global_attribute4",          limit: 150
    t.string   "global_attribute5",          limit: 150
    t.string   "global_attribute6",          limit: 150
    t.string   "global_attribute7",          limit: 150
    t.string   "global_attribute8",          limit: 150
    t.string   "global_attribute9",          limit: 150
    t.string   "global_attribute10",         limit: 150
    t.string   "global_attribute11",         limit: 150
    t.string   "global_attribute12",         limit: 150
    t.string   "global_attribute13",         limit: 150
    t.string   "global_attribute14",         limit: 150
    t.string   "global_attribute15",         limit: 150
    t.string   "global_attribute16",         limit: 150
    t.string   "global_attribute17",         limit: 150
    t.string   "global_attribute18",         limit: 150
    t.string   "global_attribute19",         limit: 150
    t.string   "global_attribute20",         limit: 150
    t.integer  "external_bank_account_id",   limit: nil
    t.decimal  "inv_curr_gross_amount"
    t.integer  "checkrun_id",                limit: nil
    t.string   "dbi_events_complete_flag",   limit: 1
    t.string   "iby_hold_reason",            limit: 2000
    t.string   "payment_method_code",        limit: 30
    t.string   "remittance_message1",        limit: 150
    t.string   "remittance_message2",        limit: 150
    t.string   "remittance_message3",        limit: 150
    t.string   "remit_to_supplier_name",     limit: 240
    t.integer  "remit_to_supplier_id",       limit: nil
    t.string   "remit_to_supplier_site",     limit: 240
    t.integer  "remit_to_supplier_site_id",  limit: nil
    t.integer  "relationship_id",            limit: nil
  end

  create_table "ap_supplier_sites_int150403", id: false, force: :cascade do |t|
    t.integer  "vendor_interface_id",            limit: nil
    t.datetime "last_update_date"
    t.integer  "last_updated_by",                limit: 15,   precision: 15
    t.integer  "vendor_id",                      limit: nil
    t.string   "vendor_site_code",               limit: 15,                  null: false
    t.string   "vendor_site_code_alt",           limit: 320
    t.integer  "last_update_login",              limit: 15,   precision: 15
    t.datetime "creation_date"
    t.integer  "created_by",                     limit: 15,   precision: 15
    t.string   "purchasing_site_flag",           limit: 1
    t.string   "rfq_only_site_flag",             limit: 1
    t.string   "pay_site_flag",                  limit: 1
    t.string   "attention_ar_flag",              limit: 1
    t.string   "address_line1",                  limit: 240
    t.string   "address_lines_alt",              limit: 560
    t.string   "address_line2",                  limit: 240
    t.string   "address_line3",                  limit: 240
    t.string   "city",                           limit: 60
    t.string   "state",                          limit: 150
    t.string   "zip",                            limit: 60
    t.string   "province",                       limit: 150
    t.string   "country",                        limit: 60
    t.string   "area_code",                      limit: 10
    t.string   "phone",                          limit: 15
    t.string   "customer_num",                   limit: 25
    t.integer  "ship_to_location_id",            limit: nil
    t.string   "ship_to_location_code",          limit: 60
    t.integer  "bill_to_location_id",            limit: nil
    t.string   "bill_to_location_code",          limit: 60
    t.string   "ship_via_lookup_code",           limit: 25
    t.string   "freight_terms_lookup_code",      limit: 25
    t.string   "fob_lookup_code",                limit: 25
    t.datetime "inactive_date"
    t.string   "fax",                            limit: 15
    t.string   "fax_area_code",                  limit: 10
    t.string   "telex",                          limit: 15
    t.string   "payment_method_lookup_code",     limit: 30
    t.string   "terms_date_basis",               limit: 25
    t.string   "vat_code",                       limit: 30
    t.integer  "distribution_set_id",            limit: nil
    t.string   "distribution_set_name",          limit: 50
    t.integer  "accts_pay_code_combination_id",  limit: nil
    t.integer  "prepay_code_combination_id",     limit: nil
    t.string   "pay_group_lookup_code",          limit: 25
    t.decimal  "payment_priority"
    t.integer  "terms_id",                       limit: nil
    t.string   "terms_name",                     limit: 50
    t.decimal  "invoice_amount_limit"
    t.string   "pay_date_basis_lookup_code",     limit: 25
    t.string   "always_take_disc_flag",          limit: 1
    t.string   "invoice_currency_code",          limit: 15
    t.string   "payment_currency_code",          limit: 15
    t.string   "hold_all_payments_flag",         limit: 1
    t.string   "hold_future_payments_flag",      limit: 1
    t.string   "hold_reason",                    limit: 240
    t.string   "hold_unmatched_invoices_flag",   limit: 1
    t.string   "ap_tax_rounding_rule",           limit: 1
    t.string   "auto_tax_calc_flag",             limit: 1
    t.string   "auto_tax_calc_override",         limit: 1
    t.string   "amount_includes_tax_flag",       limit: 1
    t.string   "exclusive_payment_flag",         limit: 1
    t.string   "tax_reporting_site_flag",        limit: 1
    t.string   "attribute_category",             limit: 30
    t.string   "attribute1",                     limit: 150
    t.string   "attribute2",                     limit: 150
    t.string   "attribute3",                     limit: 150
    t.string   "attribute4",                     limit: 150
    t.string   "attribute5",                     limit: 150
    t.string   "attribute6",                     limit: 150
    t.string   "attribute7",                     limit: 150
    t.string   "attribute8",                     limit: 150
    t.string   "attribute9",                     limit: 150
    t.string   "attribute10",                    limit: 150
    t.string   "attribute11",                    limit: 150
    t.string   "attribute12",                    limit: 150
    t.string   "attribute13",                    limit: 150
    t.string   "attribute14",                    limit: 150
    t.string   "attribute15",                    limit: 150
    t.integer  "request_id",                     limit: nil
    t.integer  "program_application_id",         limit: nil
    t.integer  "program_id",                     limit: nil
    t.datetime "program_update_date"
    t.string   "exclude_freight_from_discount",  limit: 1
    t.string   "vat_registration_num",           limit: 20
    t.integer  "org_id",                         limit: nil
    t.string   "operating_unit_name",            limit: 240
    t.string   "address_line4",                  limit: 240
    t.string   "county",                         limit: 150
    t.string   "address_style",                  limit: 30
    t.string   "language",                       limit: 30
    t.string   "allow_awt_flag",                 limit: 1
    t.integer  "awt_group_id",                   limit: nil
    t.string   "awt_group_name",                 limit: 25
    t.string   "global_attribute1",              limit: 150
    t.string   "global_attribute2",              limit: 150
    t.string   "global_attribute3",              limit: 150
    t.string   "global_attribute4",              limit: 150
    t.string   "global_attribute5",              limit: 150
    t.string   "global_attribute6",              limit: 150
    t.string   "global_attribute7",              limit: 150
    t.string   "global_attribute8",              limit: 150
    t.string   "global_attribute9",              limit: 150
    t.string   "global_attribute10",             limit: 150
    t.string   "global_attribute11",             limit: 150
    t.string   "global_attribute12",             limit: 150
    t.string   "global_attribute13",             limit: 150
    t.string   "global_attribute14",             limit: 150
    t.string   "global_attribute15",             limit: 150
    t.string   "global_attribute16",             limit: 150
    t.string   "global_attribute17",             limit: 150
    t.string   "global_attribute18",             limit: 150
    t.string   "global_attribute19",             limit: 150
    t.string   "global_attribute20",             limit: 150
    t.string   "global_attribute_category",      limit: 30
    t.string   "edi_transaction_handling",       limit: 25
    t.string   "edi_id_number",                  limit: 30
    t.string   "edi_payment_method",             limit: 25
    t.string   "edi_payment_format",             limit: 25
    t.string   "edi_remittance_method",          limit: 25
    t.string   "bank_charge_bearer",             limit: 1
    t.string   "edi_remittance_instruction",     limit: 256
    t.string   "pay_on_code",                    limit: 25
    t.integer  "default_pay_site_id",            limit: nil
    t.string   "pay_on_receipt_summary_code",    limit: 25
    t.integer  "tp_header_id",                   limit: nil
    t.string   "ece_tp_location_code",           limit: 60
    t.string   "pcard_site_flag",                limit: 1
    t.string   "match_option",                   limit: 25
    t.string   "country_of_origin_code",         limit: 2
    t.integer  "future_dated_payment_ccid",      limit: 15,   precision: 15
    t.string   "create_debit_memo_flag",         limit: 25
    t.string   "offset_tax_flag",                limit: 1
    t.string   "supplier_notif_method",          limit: 25
    t.string   "email_address",                  limit: 2000
    t.string   "remittance_email",               limit: 2000
    t.string   "primary_pay_site_flag",          limit: 1
    t.integer  "import_request_id",              limit: nil
    t.string   "status",                         limit: 30
    t.string   "reject_code",                    limit: 2000
    t.string   "shipping_control",               limit: 30
    t.string   "duns_number",                    limit: 30
    t.integer  "tolerance_id",                   limit: nil
    t.string   "tolerance_name"
    t.string   "iby_bank_charge_bearer",         limit: 30
    t.string   "bank_instruction1_code",         limit: 30
    t.string   "bank_instruction2_code",         limit: 30
    t.string   "bank_instruction_details"
    t.string   "payment_reason_code",            limit: 30
    t.string   "payment_reason_comments",        limit: 240
    t.string   "delivery_channel_code",          limit: 30
    t.string   "payment_format_code",            limit: 150
    t.string   "settlement_priority",            limit: 30
    t.string   "payment_text_message1",          limit: 150
    t.string   "payment_text_message2",          limit: 150
    t.string   "payment_text_message3",          limit: 150
    t.integer  "vendor_site_interface_id",       limit: nil,                 null: false
    t.string   "payment_method_code",            limit: 30
    t.decimal  "retainage_rate"
    t.string   "gapless_inv_num_flag",           limit: 1
    t.string   "selling_company_identifier",     limit: 10
    t.integer  "pay_awt_group_id",               limit: nil
    t.string   "pay_awt_group_name",             limit: 25
    t.integer  "party_site_id",                  limit: nil
    t.string   "party_site_name",                limit: 240
    t.string   "remit_advice_delivery_method",   limit: 30
    t.string   "remit_advice_fax",               limit: 100
    t.string   "party_orig_system",              limit: 30
    t.string   "party_orig_system_reference"
    t.string   "party_site_orig_system",         limit: 30
    t.string   "party_site_orig_sys_reference"
    t.string   "supplier_site_orig_system",      limit: 30
    t.string   "sup_site_orig_system_reference"
    t.integer  "sdh_batch_id",                   limit: nil
    t.integer  "party_id",                       limit: nil
    t.integer  "location_id",                    limit: nil
    t.string   "cage_code",                      limit: 5
    t.string   "legal_business_name",            limit: 240
    t.string   "doing_bus_as_name",              limit: 240
    t.string   "division_name",                  limit: 60
    t.string   "small_business_code",            limit: 10
    t.string   "ccr_comments",                   limit: 240
    t.datetime "debarment_start_date"
    t.datetime "debarment_end_date"
  end

  create_table "ap_suppliers_backup_6050423", id: false, force: :cascade do |t|
    t.integer  "vendor_id",                     limit: nil, null: false
    t.integer  "party_id",                      limit: nil, null: false
    t.datetime "creation_date",                             null: false
    t.integer  "worker_id",                     limit: nil
    t.string   "num_1099",                      limit: 30
    t.string   "individual_1099",               limit: 30
    t.string   "organization_type_lookup_code", limit: 25
    t.string   "vendor_type_lookup_code",       limit: 30
    t.integer  "employee_id",                   limit: nil
  end

  create_table "ap_temp_chk_driver_8966238", id: false, force: :cascade do |t|
    t.integer  "check_id",           limit: nil,                null: false
    t.integer  "check_number",       limit: 15,  precision: 15, null: false
    t.datetime "check_date",                                    null: false
    t.string   "vendor_name",        limit: 240
    t.string   "vendor_site_code",   limit: 15
    t.decimal  "amount",                                        null: false
    t.string   "status_lookup_code", limit: 25
    t.integer  "org_id",             limit: nil
    t.string   "process_flag",       limit: 1
  end

  create_table "ap_temp_data_driver_8525551", id: false, force: :cascade do |t|
    t.integer  "checkrun_id",    limit: nil
    t.datetime "check_date"
    t.string   "ppr_name"
    t.string   "ppr_status",     limit: 30
    t.integer  "invoices_held",  limit: 15,  precision: 15
    t.integer  "schedules_held", limit: 15,  precision: 15
    t.string   "process_flag",   limit: 1,                  default: "Y"
  end

  create_table "ap_temp_data_driver_8525551_d", id: false, force: :cascade do |t|
    t.integer  "checkrun_id",  limit: nil
    t.datetime "check_date"
    t.string   "ppr_name"
    t.string   "ppr_status",   limit: 30
    t.integer  "invoice_id",   limit: nil
    t.integer  "schedule_num", limit: 15,  precision: 15
    t.string   "invoice_num",  limit: 50
    t.datetime "invoice_date"
  end

  create_table "ap_temp_inv_driver_8966238", id: false, force: :cascade do |t|
    t.string   "invoice_type_lookup_code", limit: 25
    t.integer  "invoice_id",               limit: nil
    t.integer  "invoice_distribution_id",  limit: nil
    t.string   "cancellation_flag",        limit: 1
    t.integer  "prepay_distribution_id",   limit: nil
    t.integer  "parent_reversal_id",       limit: nil
    t.string   "invoice_num",              limit: 50
    t.datetime "invoice_date"
    t.string   "vendor_name",              limit: 240
    t.string   "vendor_site_code",         limit: 15
    t.string   "invoice_status",           limit: 4000
    t.integer  "org_id",                   limit: nil
    t.string   "distribution_type",        limit: 30
    t.integer  "accounting_event_id",      limit: nil
    t.string   "process_flag",             limit: 1
  end

  create_table "ap_temp_prepay_driver_8966238", id: false, force: :cascade do |t|
    t.string   "invoice_type_lookup_code", limit: 25
    t.integer  "invoice_id",               limit: nil
    t.integer  "invoice_distribution_id",  limit: nil
    t.string   "cancellation_flag",        limit: 1
    t.integer  "prepay_distribution_id",   limit: nil
    t.integer  "parent_reversal_id",       limit: nil
    t.string   "invoice_num",              limit: 50
    t.datetime "invoice_date"
    t.string   "vendor_name",              limit: 240
    t.string   "vendor_site_code",         limit: 15
    t.string   "invoice_status",           limit: 4000
    t.integer  "org_id",                   limit: nil
    t.string   "distribution_type",        limit: 30
    t.integer  "accounting_event_id",      limit: nil
    t.string   "process_flag",             limit: 1
  end

# Could not dump table "aq$_wf_bpel_qtab_g" because of following StandardError
#   Unknown type 'SYS.AQ$_SIG_PROP' for column 'sign'

# Could not dump table "aq$_wf_bpel_qtab_h" because of following StandardError
#   Unknown type 'ROWID' for column 'hint'

# Could not dump table "aq$_wf_bpel_qtab_i" because of following StandardError
#   Unknown type 'ROWID' for column 'hint'

  create_table "aq$_wf_bpel_qtab_l", id: false, force: :cascade do |t|
    t.raw       "msgid",          limit: 16
    t.decimal   "subscriber#"
    t.string    "name",           limit: 30
    t.decimal   "address#"
    t.timestamp "dequeue_time",   limit: 6
    t.string    "transaction_id", limit: 30
    t.decimal   "dequeue_user"
    t.raw       "flags",          limit: 1
  end

  create_table "aq$_wf_bpel_qtab_s", primary_key: "subscriber_id", force: :cascade do |t|
    t.string    "queue_name",            limit: 30,   null: false
    t.string    "name",                  limit: 30
    t.string    "address",               limit: 1024
    t.decimal   "protocol"
    t.decimal   "subscriber_type"
    t.string    "rule_name",             limit: 30
    t.string    "trans_name",            limit: 61
    t.string    "ruleset_name",          limit: 65
    t.string    "negative_ruleset_name", limit: 65
    t.decimal   "scn_at_remove"
    t.timestamp "creation_time",         limit: 6
    t.timestamp "modification_time",     limit: 6
    t.timestamp "deletion_time",         limit: 6
    t.decimal   "scn_at_add"
  end

  create_table "aq$_wf_bpel_qtab_t", id: false, force: :cascade do |t|
    t.timestamp "next_date", limit: 6,  null: false
    t.string    "txn_id",    limit: 30, null: false
    t.raw       "msgid",     limit: 16, null: false
    t.decimal   "action"
  end

  create_table "ar_il_cash_receipts_gt", temporary: true, comment: "This is a global temporary table, used for israeli receipt printing program.", id: false, force: :cascade do |t|
    t.integer  "cash_receipt_id",         limit: nil,                comment: "Cash Receipt Id"
    t.string   "receipt_number",          limit: 30
    t.datetime "receipt_date",                                       comment: "Receipt Date"
    t.string   "receipt_status",          limit: 30,                 comment: "Receipt Status"
    t.integer  "document_number",         limit: 15,  precision: 15, comment: "Document Number"
    t.decimal  "receipt_amount",                                     comment: "Receipt Amount"
    t.string   "currency",                limit: 15,                 comment: "Currency"
    t.string   "credit_card_no",          limit: 150,                comment: "Credit Card Number"
    t.string   "credit_card_type",        limit: 150,                comment: "Credit Card Type"
    t.datetime "maturity_date",                                      comment: "Maturity Date"
    t.string   "method_name",             limit: 30,                 comment: "Method Name"
    t.string   "bank_account",            limit: 30
    t.string   "bank_name",               limit: 360,                comment: "Bank Name"
    t.string   "bank_branch_name",        limit: 360,                comment: "Bank Branch Name"
    t.string   "customer_name",           limit: 360,                comment: "Customer Name"
    t.string   "customer_number",         limit: 30,                 comment: "Customer Number"
    t.string   "tax_registration_number", limit: 50,                 comment: "Tax Registration Number"
    t.integer  "cust_account_id",         limit: nil,                comment: "Customer Account Id"
    t.integer  "cust_acct_site_id",       limit: nil,                comment: "Customer Account Site Id"
    t.string   "address_line1",           limit: 600,                comment: "Customer Address Line1"
    t.string   "address_line2",           limit: 240,                comment: "Customer Address Line2"
    t.string   "user_name",               limit: 150,                comment: "User Name"
    t.string   "attribute1",              limit: 150,                comment: "Attribute1"
    t.string   "attribute2",              limit: 150,                comment: "Attribute2"
    t.string   "city",                    limit: 150,                comment: "City"
    t.string   "postal_code",             limit: 150,                comment: "Postal Code"
    t.string   "copy_or_original",        limit: 150,                comment: "Copy or Original"
  end

  create_table "ar_rem_cr_id_gtt", temporary: true, id: false, force: :cascade do |t|
    t.integer "cash_receipt_history_id", limit: nil
    t.integer "cash_receipt_id",         limit: nil
  end

  create_table "asf10270844perz_lf_object_temp", id: false, force: :cascade do |t|
    t.integer  "object_id",                    limit: nil,                null: false
    t.integer  "parent_id",                    limit: nil
    t.integer  "application_id",               limit: nil
    t.string   "object_name",                  limit: 60
    t.string   "object_description",           limit: 240
    t.decimal  "object_version_number",                                   null: false
    t.integer  "created_by",                   limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                                        null: false
    t.integer  "last_updated_by",              limit: 15,  precision: 15, null: false
    t.integer  "last_update_login",            limit: 15,  precision: 15
    t.integer  "jtf_perz_lf_object_object_id", limit: nil
    t.integer  "security_group_id",            limit: nil
  end

  create_table "asf10270844perz_obj_map_temp", id: false, force: :cascade do |t|
    t.integer  "obj_map_id",        limit: nil,                null: false
    t.integer  "map_id",            limit: nil
    t.integer  "object_id",         limit: nil
    t.integer  "created_by",        limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                             null: false
    t.integer  "last_updated_by",   limit: 15,  precision: 15, null: false
    t.integer  "last_update_login", limit: 15,  precision: 15
    t.integer  "security_group_id", limit: nil
  end

  create_table "asf_fndattdoc05310236_bak", id: false, force: :cascade do |t|
    t.integer  "attached_document_id",     limit: nil, null: false
    t.integer  "document_id",              limit: nil, null: false
    t.datetime "creation_date",                        null: false
    t.decimal  "created_by",                           null: false
    t.datetime "last_update_date",                     null: false
    t.decimal  "last_updated_by",                      null: false
    t.decimal  "last_update_login"
    t.decimal  "seq_num",                              null: false
    t.string   "entity_name",              limit: 40,  null: false
    t.string   "pk1_value",                limit: 100
    t.string   "pk2_value",                limit: 100
    t.string   "pk3_value",                limit: 100
    t.string   "pk4_value",                limit: 150
    t.string   "pk5_value",                limit: 150
    t.string   "automatically_added_flag", limit: 1,   null: false
    t.integer  "program_application_id",   limit: nil
    t.integer  "program_id",               limit: nil
    t.datetime "program_update_date"
    t.integer  "request_id",               limit: nil
    t.string   "attribute_category",       limit: 30
    t.string   "attribute1",               limit: 150
    t.string   "attribute2",               limit: 150
    t.string   "attribute3",               limit: 150
    t.string   "attribute4",               limit: 150
    t.string   "attribute5",               limit: 150
    t.string   "attribute6",               limit: 150
    t.string   "attribute7",               limit: 150
    t.string   "attribute8",               limit: 150
    t.string   "attribute9",               limit: 150
    t.string   "attribute10",              limit: 150
    t.string   "attribute11",              limit: 150
    t.string   "attribute12",              limit: 150
    t.string   "attribute13",              limit: 150
    t.string   "attribute14",              limit: 150
    t.string   "attribute15",              limit: 150
    t.string   "column1",                  limit: 30
    t.string   "app_source_version"
  end

  create_table "asf_fndattdoc06250902_bak", id: false, force: :cascade do |t|
    t.integer  "attached_document_id",     limit: nil, null: false
    t.integer  "document_id",              limit: nil, null: false
    t.datetime "creation_date",                        null: false
    t.decimal  "created_by",                           null: false
    t.datetime "last_update_date",                     null: false
    t.decimal  "last_updated_by",                      null: false
    t.decimal  "last_update_login"
    t.decimal  "seq_num",                              null: false
    t.string   "entity_name",              limit: 40,  null: false
    t.string   "pk1_value",                limit: 100
    t.string   "pk2_value",                limit: 100
    t.string   "pk3_value",                limit: 100
    t.string   "pk4_value",                limit: 150
    t.string   "pk5_value",                limit: 150
    t.string   "automatically_added_flag", limit: 1,   null: false
    t.integer  "program_application_id",   limit: nil
    t.integer  "program_id",               limit: nil
    t.datetime "program_update_date"
    t.integer  "request_id",               limit: nil
    t.string   "attribute_category",       limit: 30
    t.string   "attribute1",               limit: 150
    t.string   "attribute2",               limit: 150
    t.string   "attribute3",               limit: 150
    t.string   "attribute4",               limit: 150
    t.string   "attribute5",               limit: 150
    t.string   "attribute6",               limit: 150
    t.string   "attribute7",               limit: 150
    t.string   "attribute8",               limit: 150
    t.string   "attribute9",               limit: 150
    t.string   "attribute10",              limit: 150
    t.string   "attribute11",              limit: 150
    t.string   "attribute12",              limit: 150
    t.string   "attribute13",              limit: 150
    t.string   "attribute14",              limit: 150
    t.string   "attribute15",              limit: 150
    t.string   "column1",                  limit: 30
    t.string   "app_source_version"
    t.integer  "category_id",              limit: nil
    t.string   "status",                   limit: 30
  end

  create_table "asf_fndattdoc10261245_bak", id: false, force: :cascade do |t|
    t.integer  "attached_document_id",     limit: nil, null: false
    t.integer  "document_id",              limit: nil, null: false
    t.datetime "creation_date",                        null: false
    t.decimal  "created_by",                           null: false
    t.datetime "last_update_date",                     null: false
    t.decimal  "last_updated_by",                      null: false
    t.decimal  "last_update_login"
    t.decimal  "seq_num",                              null: false
    t.string   "entity_name",              limit: 40,  null: false
    t.string   "pk1_value",                limit: 100
    t.string   "pk2_value",                limit: 100
    t.string   "pk3_value",                limit: 100
    t.string   "pk4_value",                limit: 150
    t.string   "pk5_value",                limit: 150
    t.string   "automatically_added_flag", limit: 1,   null: false
    t.integer  "program_application_id",   limit: nil
    t.integer  "program_id",               limit: nil
    t.datetime "program_update_date"
    t.integer  "request_id",               limit: nil
    t.string   "attribute_category",       limit: 30
    t.string   "attribute1",               limit: 150
    t.string   "attribute2",               limit: 150
    t.string   "attribute3",               limit: 150
    t.string   "attribute4",               limit: 150
    t.string   "attribute5",               limit: 150
    t.string   "attribute6",               limit: 150
    t.string   "attribute7",               limit: 150
    t.string   "attribute8",               limit: 150
    t.string   "attribute9",               limit: 150
    t.string   "attribute10",              limit: 150
    t.string   "attribute11",              limit: 150
    t.string   "attribute12",              limit: 150
    t.string   "attribute13",              limit: 150
    t.string   "attribute14",              limit: 150
    t.string   "attribute15",              limit: 150
    t.string   "column1",                  limit: 30
    t.string   "app_source_version"
  end

  create_table "asf_leads_bin_mv", id: false, force: :cascade do |t|
    t.integer "parent_resource_id",     limit: nil
    t.string  "period_name",            limit: 15,  null: false
    t.string  "period_type",            limit: 15,  null: false
    t.decimal "cnt"
    t.decimal "amt"
    t.decimal "conversion_status_flag"
  end

  create_table "asf_leads_chn_main_mv", id: false, force: :cascade do |t|
    t.decimal "channels"
    t.decimal "budgetamount"
    t.string  "currency_code",      limit: 3
    t.string  "channel_code",       limit: 30
    t.integer "manager_person_id",  limit: nil
    t.string  "period_name",        limit: 15,  null: false
    t.string  "period_type",        limit: 15,  null: false
    t.integer "parent_resource_id", limit: nil
  end

  create_table "asf_leads_chn_mv", id: false, force: :cascade do |t|
    t.integer "sales_lead_id",      limit: nil,  null: false
    t.decimal "budgetamount"
    t.string  "currency_code",      limit: 3
    t.string  "channel_code",       limit: 30
    t.integer "customer_id",        limit: nil,  null: false
    t.integer "manager_person_id",  limit: nil
    t.string  "period_name",        limit: 15,   null: false
    t.string  "period_type",        limit: 15,   null: false
    t.integer "parent_resource_id", limit: nil
    t.string  "description",        limit: 2000
  end

  create_table "asf_leads_chn_sum_mv", id: false, force: :cascade do |t|
    t.integer "lead_id",             limit: nil,  null: false
    t.string  "description",         limit: 2000
    t.decimal "budgetamount"
    t.string  "currency_code",       limit: 3
    t.string  "channel_code",        limit: 30
    t.integer "source_promotion_id", limit: nil
    t.integer "customer_id",         limit: nil,  null: false
    t.integer "manager_person_id",   limit: nil
    t.string  "period_name",         limit: 15,   null: false
    t.string  "period_type",         limit: 15,   null: false
    t.integer "parent_resource_id",  limit: nil
  end

  create_table "asf_leads_cmp_main_mv", id: false, force: :cascade do |t|
    t.decimal "campaigns"
    t.decimal "budgetamount"
    t.integer "source_promotion_id", limit: nil
    t.string  "currency_code",       limit: 3
    t.integer "manager_person_id",   limit: nil
    t.string  "period_name",         limit: 15,  null: false
    t.string  "period_type",         limit: 15,  null: false
    t.integer "parent_resource_id",  limit: nil
  end

  create_table "asf_leads_cmp_mv", id: false, force: :cascade do |t|
    t.integer "sales_lead_id",       limit: nil,  null: false
    t.decimal "budgetamount"
    t.integer "source_promotion_id", limit: nil
    t.string  "currency_code",       limit: 3
    t.integer "customer_id",         limit: nil,  null: false
    t.integer "manager_person_id",   limit: nil
    t.string  "period_name",         limit: 15,   null: false
    t.string  "period_type",         limit: 15,   null: false
    t.integer "parent_resource_id",  limit: nil
    t.string  "description",         limit: 2000
  end

  create_table "asf_leads_grp_mv", id: false, force: :cascade do |t|
    t.decimal "groups"
    t.integer "sales_lead_id",           limit: nil, null: false
    t.decimal "budgetamount"
    t.integer "group_id",                limit: nil, null: false
    t.string  "currency_code",           limit: 3
    t.integer "parent_group_id",         limit: nil, null: false
    t.string  "immediate_parent_flag",   limit: 1,   null: false
    t.integer "parent_resource_id",      limit: nil
    t.integer "assign_to_salesforce_id", limit: nil
    t.string  "period_name",             limit: 15,  null: false
    t.string  "period_type",             limit: 15,  null: false
  end

  create_table "asf_leads_prd_main_mv", id: false, force: :cascade do |t|
    t.decimal "budgetamount"
    t.string  "currency_code",      limit: 3
    t.integer "manager_person_id",  limit: nil
    t.string  "period_name",        limit: 15,  null: false
    t.string  "period_type",        limit: 15,  null: false
    t.integer "category_id",        limit: nil
    t.integer "category_set_id",    limit: nil
    t.decimal "products"
    t.integer "parent_resource_id", limit: nil
  end

  create_table "asf_leads_prd_mv", id: false, force: :cascade do |t|
    t.integer "sales_lead_id",      limit: nil, null: false
    t.decimal "budgetamount"
    t.string  "currency_code",      limit: 3
    t.integer "manager_person_id",  limit: nil
    t.string  "period_name",        limit: 15,  null: false
    t.string  "period_type",        limit: 15,  null: false
    t.integer "category_id",        limit: nil
    t.integer "category_set_id",    limit: nil
    t.integer "customer_id",        limit: nil, null: false
    t.integer "parent_resource_id", limit: nil
  end

  create_table "asf_leads_prd_sum_mv", id: false, force: :cascade do |t|
    t.integer "lead_id",            limit: nil,  null: false
    t.string  "description",        limit: 2000
    t.decimal "budgetamount"
    t.string  "currency_code",      limit: 3
    t.integer "customer_id",        limit: nil,  null: false
    t.integer "manager_person_id",  limit: nil
    t.string  "period_name",        limit: 15,   null: false
    t.string  "period_type",        limit: 15,   null: false
    t.integer "parent_id",          limit: nil
    t.integer "category_set_id",    limit: nil
    t.decimal "products"
    t.integer "parent_resource_id", limit: nil
  end

  create_table "asf_leads_top_mv", id: false, force: :cascade do |t|
    t.decimal "leads"
    t.decimal "budgetamount"
    t.integer "customer_id",        limit: nil, null: false
    t.string  "currency_code",      limit: 3
    t.integer "manager_person_id",  limit: nil
    t.string  "period_name",        limit: 15,  null: false
    t.string  "period_type",        limit: 15,  null: false
    t.integer "parent_resource_id", limit: nil
  end

  create_table "asf_opp_chn_frcst_mv", id: false, force: :cascade do |t|
    t.decimal "leads"
    t.integer "lead_id",                limit: nil, null: false
    t.string  "channel_code",           limit: 30
    t.decimal "budget"
    t.string  "currency_code",          limit: 15
    t.decimal "conversion_status_flag"
    t.integer "sales_group_id",         limit: nil
    t.integer "credit_type_id",         limit: nil
    t.integer "salesforce_id",          limit: nil, null: false
    t.integer "parent_group_id",        limit: nil, null: false
    t.integer "product_category_id",    limit: nil
    t.integer "product_cat_set_id",     limit: nil
    t.string  "period_name",            limit: 15,  null: false
    t.string  "immediate_parent_flag",  limit: 1,   null: false
    t.string  "win_loss_indicator",     limit: 1
    t.string  "opp_open_status_flag",   limit: 1
    t.string  "forecast_rollup_flag",   limit: 1
  end

  create_table "asf_opp_chn_mv", id: false, force: :cascade do |t|
    t.string  "channel_code",           limit: 30
    t.decimal "leads"
    t.decimal "budget"
    t.string  "win_loss_indicator",     limit: 1
    t.string  "opp_open_status_flag",   limit: 1
    t.integer "manager_person_id",      limit: nil
    t.string  "conversion_period_type", limit: 15,  null: false
    t.string  "conversion_period_name", limit: 15,  null: false
    t.string  "to_currency_code",       limit: 15
    t.integer "parent_resource_id",     limit: nil
  end

  create_table "asf_opp_cmp_frcst_mv", id: false, force: :cascade do |t|
    t.decimal "leads"
    t.integer "lead_id",                limit: nil, null: false
    t.integer "source_promotion_id",    limit: nil
    t.decimal "budget"
    t.string  "currency_code",          limit: 15
    t.decimal "conversion_status_flag"
    t.integer "sales_group_id",         limit: nil
    t.integer "credit_type_id",         limit: nil
    t.integer "salesforce_id",          limit: nil, null: false
    t.integer "parent_group_id",        limit: nil, null: false
    t.integer "product_category_id",    limit: nil
    t.integer "product_cat_set_id",     limit: nil
    t.string  "period_name",            limit: 15,  null: false
    t.string  "immediate_parent_flag",  limit: 1,   null: false
    t.string  "win_loss_indicator",     limit: 1
    t.string  "opp_open_status_flag",   limit: 1
    t.string  "forecast_rollup_flag",   limit: 1
  end

  create_table "asf_opp_cmp_mv", id: false, force: :cascade do |t|
    t.integer "source_promotion_id",    limit: nil
    t.decimal "leads"
    t.decimal "budget"
    t.string  "win_loss_indicator",     limit: 1
    t.string  "opp_open_status_flag",   limit: 1
    t.integer "manager_person_id",      limit: nil
    t.string  "conversion_period_type", limit: 15,  null: false
    t.string  "conversion_period_name", limit: 15,  null: false
    t.string  "to_currency_code",       limit: 15
    t.integer "parent_resource_id",     limit: nil
  end

  create_table "asf_opp_mgr_mv", id: false, force: :cascade do |t|
    t.integer "parent_group_id",        limit: nil, null: false
    t.decimal "leads"
    t.decimal "budget"
    t.decimal "won_budget"
    t.decimal "conversion_status_flag"
    t.integer "credit_type_id",         limit: nil
    t.integer "forecast_category_id",   limit: nil, null: false
    t.string  "period_name",            limit: 15,  null: false
    t.string  "to_currency_code",       limit: 15
  end

  create_table "asf_opp_prd_frcst_mv", id: false, force: :cascade do |t|
    t.decimal  "leads"
    t.string   "interest_type",          limit: 80
    t.decimal  "budget"
    t.string   "to_currency_code",       limit: 15
    t.decimal  "won_budget"
    t.decimal  "conversion_status_flag"
    t.datetime "forecast_date"
    t.integer  "sales_group_id",         limit: nil
    t.integer  "credit_type_id",         limit: nil
    t.integer  "interest_type_id",       limit: nil
    t.integer  "salesforce_id",          limit: nil, null: false
    t.integer  "parent_group_id",        limit: nil, null: false
    t.integer  "forecast_category_id",   limit: nil, null: false
    t.integer  "lead_id",                limit: nil, null: false
    t.string   "period_name",            limit: 15,  null: false
    t.string   "immediate_parent_flag",  limit: 1,   null: false
  end

  create_table "asf_opp_prd_mv", id: false, force: :cascade do |t|
    t.integer "product_category_id",    limit: nil
    t.integer "product_cat_set_id",     limit: nil
    t.decimal "leads"
    t.decimal "budget"
    t.string  "win_loss_indicator",     limit: 1
    t.string  "forecast_rollup_flag",   limit: 1
    t.string  "opp_open_status_flag",   limit: 1
    t.integer "manager_person_id",      limit: nil
    t.string  "conversion_period_type", limit: 15,  null: false
    t.string  "conversion_period_name", limit: 15,  null: false
    t.string  "to_currency_code",       limit: 15
    t.integer "parent_resource_id",     limit: nil
    t.integer "sales_group_id",         limit: nil
    t.integer "salesforce_id",          limit: nil, null: false
    t.integer "credit_type_id",         limit: nil
  end

  create_table "asf_opp_top_frcst_mv", id: false, force: :cascade do |t|
    t.decimal  "leads"
    t.integer  "sales_credit_id",        limit: nil, null: false
    t.string   "customer_name",          limit: 360
    t.integer  "customer_id",            limit: nil, null: false
    t.string   "party_type",             limit: 30
    t.integer  "lead_id",                limit: nil, null: false
    t.string   "opp_description",        limit: 240
    t.decimal  "budget"
    t.string   "currency_code",          limit: 15
    t.decimal  "conversion_status_flag"
    t.integer  "sales_group_id",         limit: nil
    t.integer  "credit_type_id",         limit: nil
    t.integer  "salesforce_id",          limit: nil, null: false
    t.decimal  "win_probability"
    t.datetime "decision_date"
    t.string   "sales_stage",            limit: 60
    t.string   "status",                 limit: 240
    t.integer  "parent_group_id",        limit: nil, null: false
    t.integer  "product_category_id",    limit: nil
    t.integer  "product_cat_set_id",     limit: nil
    t.string   "period_name",            limit: 15,  null: false
    t.string   "immediate_parent_flag",  limit: 1,   null: false
    t.string   "win_loss_indicator",     limit: 1
    t.string   "opp_open_status_flag",   limit: 1
    t.string   "forecast_rollup_flag",   limit: 1
  end

  create_table "asf_opp_top_mv", id: false, force: :cascade do |t|
    t.string   "customer_name",          limit: 360
    t.integer  "customer_id",            limit: nil, null: false
    t.string   "party_type",             limit: 30
    t.integer  "lead_id",                limit: nil, null: false
    t.decimal  "total_amount"
    t.string   "opp_description",        limit: 240
    t.string   "win_loss_indicator",     limit: 1
    t.string   "opp_open_status_flag",   limit: 1
    t.integer  "manager_person_id",      limit: nil
    t.string   "conversion_period_type", limit: 15,  null: false
    t.string   "conversion_period_name", limit: 15,  null: false
    t.string   "to_currency_code",       limit: 15
    t.decimal  "win_probability"
    t.datetime "decision_date"
    t.string   "sales_stage",            limit: 60
    t.string   "status",                 limit: 240
    t.integer  "parent_resource_id",     limit: nil
    t.decimal  "currency_amount"
  end

  create_table "asf_rollup_mgr_mv", id: false, force: :cascade do |t|
    t.integer "manager_person_id",  limit: nil
    t.integer "parent_resource_id", limit: nil
    t.integer "person_id",          limit: nil
    t.integer "resource_id",        limit: nil, null: false
    t.integer "group_id",           limit: nil, null: false
    t.decimal "excnt"
  end

  create_table "asf_sc_bin_frcst_mv", id: false, force: :cascade do |t|
    t.decimal  "cnt"
    t.decimal  "pipeline_amount"
    t.decimal  "won_amount"
    t.string   "currency_code",         limit: 15
    t.string   "forecast_rollup_flag",  limit: 1
    t.string   "opp_deleted_flag",      limit: 1
    t.datetime "forecast_date"
    t.integer  "sales_group_id",        limit: nil
    t.integer  "credit_type_id",        limit: nil
    t.integer  "salesforce_id",         limit: nil, null: false
    t.integer  "parent_group_id",       limit: nil, null: false
    t.integer  "forecast_category_id",  limit: nil, null: false
    t.string   "period_name",           limit: 15,  null: false
    t.integer  "lead_id",               limit: nil, null: false
    t.string   "immediate_parent_flag", limit: 1,   null: false
  end

# Could not dump table "asf_sc_bin_mv" because of following StandardError
#   Unknown type 'ROWID' for column 'arowid'

  create_table "asf_scbin_summv", id: false, force: :cascade do |t|
    t.integer "manager_person_id",    limit: nil
    t.integer "parent_resource_id",   limit: nil
    t.integer "salesforce_id",        limit: nil, null: false
    t.integer "sales_group_id",       limit: nil
    t.string  "currency_code",        limit: 15
    t.string  "period_name",          limit: 15,  null: false
    t.string  "period_type",          limit: 15,  null: false
    t.string  "win_loss_indicator",   limit: 1
    t.string  "opp_open_status_flag", limit: 1
    t.string  "forecast_rollup_flag", limit: 1
    t.integer "credit_type_id",       limit: nil
    t.integer "product_category_id",  limit: nil
    t.integer "product_cat_set_id",   limit: nil
    t.string  "usage",                limit: 240, null: false
    t.decimal "total_amount"
    t.decimal "cnt"
    t.decimal "cnt2"
  end

  create_table "asf_scbinld_mv", id: false, force: :cascade do |t|
    t.integer "manager_person_id",    limit: nil
    t.integer "parent_resource_id",   limit: nil
    t.string  "currency_code",        limit: 15
    t.string  "period_name",          limit: 15,  null: false
    t.string  "period_type",          limit: 15,  null: false
    t.string  "win_loss_indicator",   limit: 1
    t.string  "opp_open_status_flag", limit: 1
    t.integer "lead_id",              limit: nil, null: false
    t.string  "usage",                limit: 240, null: false
    t.decimal "cnt"
  end

  create_table "asf_scbinld_summv", id: false, force: :cascade do |t|
    t.integer "manager_person_id",    limit: nil
    t.integer "parent_resource_id",   limit: nil
    t.string  "currency_code",        limit: 15
    t.string  "period_name",          limit: 15,  null: false
    t.string  "period_type",          limit: 15,  null: false
    t.string  "win_loss_indicator",   limit: 1
    t.string  "opp_open_status_flag", limit: 1
    t.string  "usage",                limit: 240, null: false
    t.decimal "cnt"
  end

# Could not dump table "asf_sl_bin_mv" because of following StandardError
#   Unknown type 'ROWID' for column 'arowid'

  create_table "asf_slbin_summv", id: false, force: :cascade do |t|
    t.integer "manager_person_id",  limit: nil
    t.integer "parent_resource_id", limit: nil
    t.string  "period_name",        limit: 15,  null: false
    t.string  "period_type",        limit: 15,  null: false
    t.string  "currency_code",      limit: 15
    t.string  "usage",              limit: 240, null: false
    t.decimal "total_amount"
    t.decimal "cnt"
    t.decimal "cnt2"
  end

  create_table "asf_slbinld_mv", id: false, force: :cascade do |t|
    t.integer "manager_person_id",  limit: nil
    t.integer "parent_resource_id", limit: nil
    t.string  "period_name",        limit: 15,  null: false
    t.string  "period_type",        limit: 15,  null: false
    t.string  "currency_code",      limit: 15
    t.integer "sales_lead_id",      limit: nil, null: false
    t.string  "usage",              limit: 240, null: false
    t.decimal "cnt"
  end

  create_table "asf_slbinld_summv", id: false, force: :cascade do |t|
    t.integer "manager_person_id",  limit: nil
    t.integer "parent_resource_id", limit: nil
    t.string  "period_name",        limit: 15,  null: false
    t.string  "period_type",        limit: 15,  null: false
    t.string  "currency_code",      limit: 15
    t.string  "usage",              limit: 240, null: false
    t.decimal "num_leads"
  end

  create_table "asf_var_mv", id: false, force: :cascade do |t|
    t.integer  "manager_person_id",         limit: nil
    t.integer  "parent_resource_id",        limit: nil
    t.string   "currency_code",             limit: 15
    t.string   "win_loss_indicator",        limit: 1
    t.string   "opp_open_status_flag",      limit: 1
    t.integer  "lead_id",                   limit: nil, null: false
    t.decimal  "sales_credit_amount"
    t.string   "customer_name",             limit: 360
    t.integer  "customer_id",               limit: nil, null: false
    t.string   "opp_description",           limit: 240
    t.decimal  "win_probability"
    t.string   "party_type",                limit: 30
    t.datetime "opportunity_creation_date"
    t.integer  "credit_type_id",            limit: nil
    t.datetime "decision_date"
    t.string   "status",                    limit: 240
  end

  create_table "asf_win_loss_comptator_mv", id: false, force: :cascade do |t|
    t.string  "close_competitor"
    t.decimal "win"
    t.decimal "loss"
    t.string  "forecast_rollup_flag", limit: 1
    t.integer "parent_resource_id",   limit: nil
    t.integer "sales_group_id",       limit: nil
    t.integer "salesforce_id",        limit: nil, null: false
    t.integer "parent_group_id",      limit: nil, null: false
    t.integer "product_category_id",  limit: nil
    t.integer "product_cat_set_id",   limit: nil
    t.integer "credit_type_id",       limit: nil
    t.string  "period_type",          limit: 15,  null: false
    t.string  "period_name",          limit: 15,  null: false
    t.string  "currency_code",        limit: 3
    t.decimal "currency_amount"
  end

  create_table "asf_win_loss_mv", id: false, force: :cascade do |t|
    t.integer "parent_resource_id",   limit: nil
    t.integer "salesforce_id",        limit: nil
    t.integer "sales_group_id",       limit: nil
    t.integer "parent_group_id",      limit: nil, null: false
    t.string  "period_type",          limit: 15,  null: false
    t.string  "period_name",          limit: 15
    t.integer "credit_type_id",       limit: nil
    t.string  "forecast_rollup_flag", limit: 1
    t.integer "product_category_id",  limit: nil
    t.decimal "won"
    t.decimal "lose"
  end

  create_table "asf_win_loss_prodcat_mv", id: false, force: :cascade do |t|
    t.integer "product_category_id",    limit: nil
    t.integer "product_cat_set_id",     limit: nil
    t.decimal "won"
    t.decimal "loss"
    t.string  "forecast_rollup_flag",   limit: 1
    t.integer "parent_resource_id",     limit: nil
    t.integer "sales_group_id",         limit: nil
    t.integer "salesforce_id",          limit: nil, null: false
    t.integer "credit_type_id",         limit: nil
    t.integer "parent_group_id",        limit: nil, null: false
    t.string  "conversion_period_type", limit: 15,  null: false
    t.string  "conversion_period_name", limit: 15,  null: false
    t.string  "currency_code",          limit: 3
  end

  create_table "asf_win_loss_top5_mv", id: false, force: :cascade do |t|
    t.string  "customer_name",           limit: 360
    t.integer "customer_id",             limit: nil, null: false
    t.string  "opp_description",         limit: 240
    t.string  "close_competitor"
    t.integer "lead_id",                 limit: nil, null: false
    t.decimal "sales_credit_amount"
    t.integer "party_id",                limit: nil, null: false
    t.string  "party_type",              limit: 30
    t.integer "parent_resource_id",      limit: nil
    t.integer "sales_group_id",          limit: nil
    t.integer "salesforce_id",           limit: nil, null: false
    t.integer "parent_group_id",         limit: nil, null: false
    t.integer "product_category_id",     limit: nil
    t.integer "product_cat_set_id",      limit: nil
    t.integer "credit_type_id",          limit: nil
    t.string  "period_type",             limit: 15,  null: false
    t.string  "period_name",             limit: 15,  null: false
    t.string  "forecast_rollup_flag",    limit: 1
    t.string  "currency_code",           limit: 3
    t.decimal "cur_sales_credit_amount"
  end

  create_table "asf_win_won_top5_mv", id: false, force: :cascade do |t|
    t.string  "customer_name",         limit: 360
    t.integer "customer_id",           limit: nil, null: false
    t.string  "opp_description",       limit: 240
    t.string  "close_competitor"
    t.integer "lead_id",               limit: nil, null: false
    t.decimal "total_amount"
    t.integer "party_id",              limit: nil, null: false
    t.string  "party_type",            limit: 30
    t.integer "parent_resource_id",    limit: nil
    t.integer "sales_group_id",        limit: nil
    t.integer "salesforce_id",         limit: nil, null: false
    t.integer "parent_group_id",       limit: nil, null: false
    t.integer "product_category_id",   limit: nil
    t.integer "product_cat_set_id",    limit: nil
    t.integer "credit_type_id",        limit: nil
    t.string  "period_type",           limit: 15,  null: false
    t.string  "period_name",           limit: 15,  null: false
    t.string  "forecast_rollup_flag",  limit: 1
    t.string  "currency_code",         limit: 3
    t.decimal "currency_total_amount"
  end

  create_table "asfb05300902p_bin_lf_object", id: false, force: :cascade do |t|
    t.integer  "object_id",                    limit: nil,                null: false
    t.integer  "parent_id",                    limit: nil
    t.integer  "application_id",               limit: nil
    t.string   "object_name",                  limit: 60
    t.string   "object_description",           limit: 240
    t.decimal  "object_version_number",                                   null: false
    t.integer  "created_by",                   limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                                        null: false
    t.integer  "last_updated_by",              limit: 15,  precision: 15, null: false
    t.integer  "last_update_login",            limit: 15,  precision: 15
    t.integer  "jtf_perz_lf_object_object_id", limit: nil
    t.integer  "security_group_id",            limit: nil
  end

  create_table "asfb05300902p_bin_lf_value", id: false, force: :cascade do |t|
    t.integer  "perz_lf_value_id",      limit: nil,                null: false
    t.integer  "profile_id",            limit: nil,                null: false
    t.integer  "obj_map_id",            limit: nil
    t.string   "attribute_value",       limit: 100
    t.string   "active_flag",           limit: 1
    t.decimal  "priority"
    t.decimal  "object_version_number",                            null: false
    t.integer  "created_by",            limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                                 null: false
    t.integer  "last_updated_by",       limit: 15,  precision: 15, null: false
    t.integer  "last_update_login",     limit: 15,  precision: 15
    t.integer  "security_group_id",     limit: nil
  end

  create_table "asfb05300902p_bin_obj_map", id: false, force: :cascade do |t|
    t.integer  "obj_map_id",        limit: nil,                null: false
    t.integer  "map_id",            limit: nil
    t.integer  "object_id",         limit: nil
    t.integer  "created_by",        limit: 15,  precision: 15, null: false
    t.datetime "last_update_date",                             null: false
    t.integer  "last_updated_by",   limit: 15,  precision: 15, null: false
    t.integer  "last_update_login", limit: 15,  precision: 15
    t.integer  "security_group_id", limit: nil
  end

