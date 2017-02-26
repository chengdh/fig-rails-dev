#coding: utf-8
#领退料计划
class CuxTran < ActiveRecord::Base
  self.table_name = "cux_transaction_headers_all_a"
  has_many :cux_tran_lines,foreign_key: "require_id"
end
