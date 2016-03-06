class SalaryItemHeadersController < InheritedResources::Base

  private

    def salary_item_header_params
      params.require(:salary_item_header).permit(:org_id, :order_by, :is_active, :note)
    end
end

