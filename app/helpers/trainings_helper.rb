#coding: utf-8
module TrainingsHelper
  def assess_types_for_select
    [["测试","test"],["提问","question"],["座谈","conversion"]]
  end
  def check_states_for_select
    [["通过","confirmed"],["不通过","rejected"]]
  end
end
