#coding: utf-8
module AreaInfosHelper
  def area_infos_for_select
    AreaInfo.all.map {|ai| [ai.name,ai.id]}
  end
end
