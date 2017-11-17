#coding: utf-8
#固定资产转移行
class CuxFaTransferLine < ActiveRecord::Base
  self.table_name = "cux_fa_transfer_lines_a"
  self.primary_key = "line_id"
  belongs_to :cux_fa_transfer_header,foreign_key: :header_id
end
