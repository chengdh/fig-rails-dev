#coding: utf-8
#考评表管理
class Assessment < ActiveRecord::Base
  belongs_to :org

  belongs_to :user
  belongs_to :checker,class_name: "User"

  belongs_to :submiter,class_name: "User"

  default_scope {order("mth DESC,org_id")}
  default_value_for(:table_date) {Date.today}

  validates :org_id,:name,:mth,:table_date,:user_id, presence: true
  validates :k_safety_table_marks,
  :k_accident_marks,
  :k_training_marks,
  :k_planb_doc_marks,
  :k_meeting_marks,
  :k_hidden_danger_marks,
  :k_big_hidden_danger_marks,
  :k_files_marks,
  :k_big_accident_marks,
  :k_punishment_marks,
  :reward_marks, numericality: true

  def check_state_des
    ret = ""
    ret = "草稿(未审批)" if check_state.eql?("draft")
    ret = "已提交" if check_state.eql?("submited")
    ret = "通过" if check_state.eql?("confirmed")
    ret = "不通过" if check_state.eql?("rejected")
    ret
  end
  def sum_marks
    100 + reward_marks + k_safety_table_marks + k_accident_marks + k_training_marks -
      k_planb_doc_marks + k_meeting_marks + k_hidden_danger_marks + k_big_hidden_danger_marks +
      k_big_accident_marks + k_punishment_marks + k_files_marks
  end

  #批量-自动生成考评表
  def self.batch_auto_generate
    mth = Date.today.last_month.strftime("%Y%m")
    org_ids = Org.get_branch_ids
    org_ids.each  {|org_id| auto_generate(mth,org_id,false)}
  end
  #自动生成考评表
  #每月3号生成上月
  def self.auto_generate(mth,org_id,re_create = false)
    return if exists?(mth: mth,org_id: org_id) and not re_create
    org = Org.find(org_id)
    year = mth[0..3]
    first_day = Date.parse("#{mth[0..3]}-#{mth[4..5]}-01")
    #安委会会议	至少每半年一次。（每年1月2日和7月2日） 10分
    k_meeting_marks = 0
    #判断6月与12月
    if mth[4..5].eql?("06")
      exist = Meeting.exists?(["DATE_FORMAT(table_date,'%Y%m%d') >= ? AND DATE_FORMAT(table_date,'%Y%m%d') <= ? AND org_id = ? AND check_state='confirmed'","#{year}0101","#{year}0630",org_id])
      k_meeting_marks  = -5 unless exist
    end
    if mth[4..5].eql?("12")
      exist = Meeting.exists?(["DATE_FORMAT(table_date,'%Y%m%d') >= ? AND DATE_FORMAT(table_date,'%Y%m%d') <= ? AND org_id = ? AND check_state='confirmed'","#{year}0701","#{year}1231",org_id])
      k_meeting_marks  = -5 unless exist
    end

    #工作、事故报告	每月一次。（每月2日） 12分
    k_safety_table_marks = 0
    exist_1 = SafetyTable.exists?(["mth = ? AND org_id = ? ",mth,org_id])
    exist_2 = AccidentHeader.exists?(["mth = ? AND org_id = ? ",mth,org_id])
    k_safety_table_marks = -1 unless exist_1 or exist_2
    #教育培训	至少每半年一次。（每年1月2日和7月2日）	10	每半年至少开展一次全员安全教育，每少一次扣5分。
    k_training_marks = 0
    if mth[4..5].eql?("06")
      exist = Training.exists?(["DATE_FORMAT(table_date,'%Y%m%d') >= ? AND DATE_FORMAT(table_date,'%Y%m%d') <= ? AND org_id = ? AND check_state='confirmed'","#{year}0101","#{year}0630",org_id])
      k_training_marks = -5 unless exist
    end
    if mth[4..5].eql?("12")
      exist = Training.exists?(["DATE_FORMAT(table_date,'%Y%m%d') >= ? AND DATE_FORMAT(table_date,'%Y%m%d') <= ? AND org_id = ? AND check_state='confirmed'","#{year}0701","#{year}1231",org_id])
      k_training_marks = -5 unless exist
    end




    #演练评审	至少每半年一次。（每年1月2日和7月2日）	10	每半年至少召开开展一次事故应急演练及预案评审，每少一次扣5分。
    k_planb_doc_marks = 0

    if mth[4..5].eql?("06")
      exist = PlanbDoc.exists?(["DATE_FORMAT(table_date,'%Y%m%d') >= ? AND DATE_FORMAT(table_date,'%Y%m%d') <= ? AND org_id = ? AND check_state='confirmed'","#{year}0101","#{year}0630",org_id])
      k_planb_doc_marks k_training_marks = -5 unless exist
    end
    if mth[4..5].eql?("12")
      exist = PlanbDoc.exists?(["DATE_FORMAT(table_date,'%Y%m%d') >= ? AND DATE_FORMAT(table_date,'%Y%m%d') <= ? AND org_id = ? AND check_state='confirmed'","#{year}0701","#{year}1231",org_id])
      k_planb_doc_marks = -5 unless exist
    end


    #档案、台账记录	按要求完善电子档案记录。（自动辨识完善度）	8	档案记录的完善酌情扣分。
    k_files_marks = 0

    #消防设施
    exists = FireFightingEquipment.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists
    #交通工具及驾驶员
    exists = Vehicle.exists?(org_id: org_id) and Driver.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists
    #特种设备
    exists = SpecEquipment.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists
    #仓库信息
    exists = SpecWarehouse.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists
    #电气设备
    exists = HighPressureRoom.exists?(org_id: org_id) and LowPressureRoom.exists?(org_id: org_id) and
      Transformer.exists?(org_id: org_id) and DistributeBox.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists
    #相关方人员
    exists = TemporaryEmployee.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists
    #劳动防护用品 
    exists = ProtectEquipment.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists
    #房舍及院落
    exists = House.exists?(org_id: org_id)
    k_files_marks -= 1 unless exists

    
    Assessment.destroy_all(mth: mth,org_id: org_id) if re_create
    assessment = Assessment.new(mth: mth,org_id: org_id,table_date: Date.today,user_id:1,
                               name: "#{org.name}#{mth}考核表",
                               k_safety_table_marks: k_safety_table_marks,
                               k_meeting_marks: k_meeting_marks,
                               k_hidden_danger_marks: 0,
                               k_files_marks: k_files_marks,
                               k_training_marks: k_training_marks,
                               k_planb_doc_marks: k_planb_doc_marks
                               )

    assessment.save!
    assessment
  end
end
