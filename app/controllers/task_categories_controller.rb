#coding: utf-8
class TaskCategoriesController < BaseController
  private
  def task_category_params
    params.require(:task_category).permit(:name, :order_by, :is_active, :note)
  end
end

