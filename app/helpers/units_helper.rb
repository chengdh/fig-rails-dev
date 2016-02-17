#coding: utf-8
module UnitsHelper
  def units_for_select
    Unit.where(is_active: true).map {|u| [u.name,u.id]}
  end
end
