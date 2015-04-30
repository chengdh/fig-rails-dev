#coding: utf-8
module RegisterInfosHelper
  def logistics_levels_for_select
    [['AAAAA级别',5],['AAAA级别',4],['AAA级别',3],['普通',2]]
  end
  def ec_types_for_select
    {'国有' => 1,"民营" => 2,"外资" => 3,"其他" => 4}
  end
end
