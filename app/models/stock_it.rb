#coding: utf-8
#库存对象
class StockIt < ActiveRecord::Base
  self.table_name = "v_stock_it"
  belongs_to :location
  belongs_to :equipment
  belongs_to :own_org,class_name: "Org"
  default_scope {includes(:location,:equipment)}
  def readonly?
    !new_record?
  end

  # Prevent objects from being destroyed
  def before_destroy
    raise ActiveRecord::ReadOnlyRecord
  end
end
