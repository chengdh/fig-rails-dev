#coding: utf-8
module TaskCategoriesHelper
  def task_categories_for_select
    TaskCategory.where(is_active: true).order("order_by ASC").map {|t| [t.name,t.id]}
  end
end
