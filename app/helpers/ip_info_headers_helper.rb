#coding: utf-8
module IpInfoHeadersHelper
  def net_types_for_select
    [["领导",1],["业务",2],["普通",3],["信息",4],["内网",5]]
  end
  def net_type_des(net_type)
    ret = ""
    ret = "领导" if net_type.eql?("1")
    ret = "业务" if net_type.eql?("2")
    ret = "普通" if net_type.eql?("3")
    ret = "信息" if net_type.eql?("4")
    ret = "内网" if net_type.eql?("5")
    ret
  end
end
