#coding: utf-8
module TasksHelper
  def task_states_for_select
    [["草稿","draft"],["已下发","deliveried"],["进行中","processing"],["已完成","finished"]]
  end
end
