class StockAsset < ActiveRecord::Base
  self.table_name = "v_stock_asset"
  belongs_to :location
  belongs_to :equipment
  belongs_to :own_org,class_name: "Org"
  def readonly?
    !new_record?
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

  # Prevent objects from being destroyed
  def before_destroy
    raise ActiveRecord::ReadOnlyRecord
  end
end
