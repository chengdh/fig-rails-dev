#coding: utf-8
#无形资产-库存
class StockVirtual < ActiveRecord::Base
  self.table_name = "v_stock_virtual"
  belongs_to :location
  belongs_to :equipment
  belongs_to :own_org,class_name: "Org"
  def readonly?
    !new_record?
  end

  # Prevent objects from being destroyed
  def before_destroy
    raise ActiveRecord::ReadOnlyRecord
  end
end
