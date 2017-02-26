#coding: utf-8
class CuxTranLine < ActiveRecord::Base
  self.table_name = "cux_transaction_lines_all_a"
  belongs_to :cux_tran,foreign_key: 'require_id'
end
