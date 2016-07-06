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

  #获取责任部门
  def own_org
    ret = nil
    if Location::LOC_TYPE_EMPLOYEE.eql?(location.location_type)
      ret = InoutLine.where(t_location_id: location_id,state: :confirmed).order("updated_at DESC").limit(1).try(:first).try(:own_org)
    end
    ret
  end
  def duty_person
    ret = ""
    if Location::LOC_TYPE_EMPLOYEE.eql?(location.location_type)
      ret = InoutLine.where(t_location_id: location_id,state: :confirmed).order("updated_at DESC").limit(1).try(:first).try(:duty_person)
    end
    ret
  end
end
