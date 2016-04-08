#coding: utf-8
#库存对象
class Stock < ActiveRecord::Base
  self.table_name = "v_stock"
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
