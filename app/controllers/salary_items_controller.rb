class SalaryItemsController < InheritedResources::Base

  private

    def salary_item_params
      params.require(:salary_item).permit(:org_id, :name, :code, :order_by, :item_type, :is_active, :is_calculate)
    end
end

