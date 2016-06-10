class SalaryReportShisController < InheritedResources::Base

  private

    def salary_report_shi_params
      params.require(:salary_report_shi).permit(:year, :org_id, :work_state, :post_level, :table_date, :user_id, :1st_mth_persons, :1st_mth_shoud_pay, :1st_mth_act_pay, :1st_persons_change)
    end
end

