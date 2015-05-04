#coding: utf-8
module RegisterInfosHelper
  def logistics_levels_for_select
    {'AAAAA级别' => 5,'AAAA级别' => 4,'AAA级别' => 3,'普通' => 2}
  end
  def ec_types_for_select
    {'国有' => 1,"民营" => 2,"外资" => 3,"其他" => 4}
  end
  def apply_types_for_select
    {'贷款贴息' => 1,"财政补助" => 2,"以奖代补" => 3}
  end

  def important_levels_for_select
    {'省' => 1,"市" => 2,"区" => 3}
  end

  def logistics_level_desc(level_id)
    ret = ""
    {'AAAAA级别' => 5,'AAAA级别' => 4,'AAA级别' => 3,'普通' => 2}.each do |k,v|
      ret = k if v == level_id
    end
    ret
  end

  def ec_type_desc(type_id)
    ret = ""
    {'国有' => 1,"民营" => 2,"外资" => 3,"其他" => 4}.each do |k,v|
      ret = k if type_id == v
    end
    ret
  end

  def important_level_desc(level_id)
    ret = ""
    {'省' => 1,"市" => 2,"区" => 3}.each do |k,v|
      ret = k if level_id == v
    end
    ret
  end
  def apply_type_desc(type_id)
    ret = ""
    {'贷款贴息' => 1,"财政补助" => 2,"以奖代补" => 3}.each do |k,v|
      ret = k if type_id == v
    end
    return ret
  end

end
