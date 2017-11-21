#coding: utf-8
#应付发票行
class CuxApInvoiceLine < ActiveRecord::Base
  self.table_name = "cux_ap_invoice_lines_a"
  self.primary_key = "line_number"
  belongs_to :cux_ap_invoice,foreign_key: :invoice_id


  #单位说明
  # 主科目代码	单位
  # 140501010101	吨
  # 140502010101	
  # 500101050101	
  # 500101050201	
  # 140503010101	立方米
  # 600101010101	千千瓦时
  #
  def uom_des
    ret = ""
    ret = "吨" if ["140501010101","140502010101","500101050101","500101050201"].include?(segment3)
    ret = "立方米" if segment3.eql?("140503010101")
    ret = "千千瓦时" if segment3.eql?("600101010101")
    ret
  end

  def self.sync_with_ebs(inv_ids)
    inv_ids.each do |inv_id|
      p_item_array = []
      p_item_array << {
        "VTYPE" => "NUM",
        "VNAME" => "invoice_id",
        "VVALUE" => inv_id,
        "VSIGN" => "EQ"
      }
      TestSoap.sync_table(self,p_item_array)
    end
  end
end
