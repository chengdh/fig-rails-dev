#coding: utf-8
module MatchRecommandsHelper
  def result_type_des(result_code)
    ret = ""
    ret = "全赢" if result_code == 2
    ret = "半赢" if result_code == 1
    ret = "走" if result_code == 0
    ret = "半输" if result_code == -1
    ret = "全输" if result_code == -2
    ret
  end
end
