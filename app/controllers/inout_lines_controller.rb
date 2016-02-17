class InoutLinesController < InheritedResources::Base

  private

    def inout_line_params
      params.require(:inout_line).permit(:inout_bill_id, :f_location_id, :t_location_id, :move_date, :state, :qty, :price, :amt)
    end
end

