#coding: utf-8
class AssessmentsController < BaseController

  private
  def assessment_params
    params.require(:assessment).permit(:org_id, :table_date, :mth, :check_state, :user_id, :checker_id,
                                       :check_date, :name, :note,:k_safety_table_marks,:k_accident_marks,
                                       :k_training_marks,
                                       :k_planb_doc_marks,
                                       :k_meeting_marks,
                                       :k_hidden_danger_marks,
                                       :k_big_hidden_danger_marks,
                                       :k_big_accident_marks,
                                       :k_punishment_marks,
                                       :reward_marks)
  end
end

