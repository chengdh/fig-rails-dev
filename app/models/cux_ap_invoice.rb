#coding: utf-8
#应付发票
class CuxApInvoice < ActiveRecord::Base
  self.table_name = "cux_ap_invoices_a"
  self.primary_key = "id"
  has_many :cux_ap_invoice_lines,foreign_key: :invoice_id
  #审批信息
  has_many :ap_wfapproval_histories,foreign_key: :invoice_id
  #附件
  has_many :cux_soa_attached_doc_vs, -> {where(table_name: "AP_INVOICES")},foreign_key: :pk1_column

  scope :bills_by_wf_itemkeys,-> (wf_itemkeys) {where(id: wf_itemkeys.map {|item_key| item_key.split("_").try(:first)})}

  #发票附加信息对应关系
  FEE_HASH = {
    "044" =>[
      "差旅费",
      {
        "出差地点" => :attribute7, 
        "起始日期" =>	 :attribute8,
        "结束日期" =>	 :attribute9, 
        "车船票" =>	 :attribute10, 
        "飞机票" =>	 :attribute11, 
        "住宿票" =>	 :attribute12, 
        "杂费" =>	 :attribute13, 
        "伙食补助" =>	 :attribute14, 
        "交通补助" =>	 :attribute15, 
      }],
      "044" => [
        "职工教育经费",
        {
          "出差地点" =>	 :attribute7, 
          "起始日期" =>	 :attribute8, 
          "结束日期" =>	 :attribute9, 
          "车船票" =>	 :attribute10, 
          "飞机票" =>	 :attribute11, 
          "住宿票" =>	 :attribute12, 
          "杂费" =>	 :attribute13, 
          "伙食补助" =>	 :attribute14, 
          "交通补助" =>	 :attribute15, 
          "培训费" =>	 :attribute5, 

        }],
        "170" => ["会议费",{
          "会议名称" =>	 :attribute7, 
          "会议地点" =>	 :attribute8, 
          "会议时间" =>	 :attribute9, 
          "会议人数" =>	 :attribute10, 
          "参加人员单位" =>	 :attribute11, 
          "房费" =>	 :attribute12, 
          "餐费" =>	 :attribute13, 
          "会议室租赁费" =>	 :attribute14, 
          "杂费" =>	 :attribute13
        }],
        "520003012" => ["差旅费",
                        {"出差地点" => :attribute7,
                         "起始日期" =>	 :attribute8, 
                         "结束日期" =>	 :attribute9, 
                         "车船票" =>	 :attribute10, 
                         "飞机票" =>	 :attribute11, 
                         "住宿票" =>	 :attribute12, 
                         "杂费" =>	 :attribute13, 
                         "伙食补助" =>	 :attribute14
        }],
        "520003018" => ["会议费",{
          "会议名称" =>	 :attribute7, 
          "会议地点" =>	 :attribute8, 
          "会议时间" =>	 :attribute9, 
          "会议人数" =>	 :attribute10, 
          "参加人员单位" =>	 :attribute11, 
          "房费" =>	 :attribute12, 
          "餐费" =>	 :attribute13, 
          "会议室租赁费" =>	 :attribute14, 
          "杂费" =>	 :attribute13
        }],
        "520003027"	=> ["培训费",{
          "培训费" =>	 :attribute5, 
          "出差地点" =>	 :attribute7, 
          "起始日期" =>	 :attribute8, 
          "结束日期" =>	 :attribute9, 
          "车船票" =>	 :attribute10, 
          "飞机票" =>	 :attribute11, 
          "住宿票" =>	 :attribute12, 
          "杂费" =>	 :attribute13, 
          "伙食补助" =>	 :attribute14, 
          "交通补助" =>	 :attribute15 
        }],
        "520010007" => ["会议费",{
          "会议名称" =>	 :attribute7, 
          "会议地点" =>	 :attribute8, 
          "会议时间" =>	 :attribute9, 
          "会议人数" =>	 :attribute10, 
          "参加人员单位" =>	 :attribute11, 
          "房费" =>	 :attribute12, 
          "餐费" =>	 :attribute13, 
          "会议室租赁费" =>	 :attribute14, 
          "杂费" =>	 :attribute13
        }],
        "520010015" => ["差旅费" ,
                        {
          "出差地点" =>	 :attribute7, 
          "起始日期" =>		 :attribute8, 
          "结束日期" =>		 :attribute9, 
          "车船票" =>		 :attribute10, 
          "飞机票" =>		 :attribute11, 
          "住宿票" =>		 :attribute12, 
          "杂费" =>		 :attribute13, 
          "伙食补助" =>		 :attribute14, 
          "交通补助" =>		 :attribute15
        }],
        "520010019" => ["培训费",{
          "培训费" =>		 :attribute5, 
          "出差地点" =>		 :attribute7, 
          "起始日期" =>		 :attribute8, 
          "结束日期" =>		 :attribute9, 
          "车船票" =>		 :attribute10, 
          "飞机票" =>		 :attribute11, 
          "住宿票" =>		 :attribute12, 
          "杂费" =>		 :attribute13, 
          "伙食补助" =>		 :attribute14, 
          "交通补助" =>		 :attribute15
        }],
        "520014010" =>["职教费"	,{
          "出差地点" =>		 :attribute7, 
          "起始日期" =>		 :attribute8, 
          "结束日期" =>		 :attribute9, 
          "车船票" =>		 :attribute10, 
          "飞机票" =>		 :attribute11, 
          "住宿票" =>		 :attribute12, 
          "杂费" =>		 :attribute13, 
          "伙食补助" =>		 :attribute14, 
          "交通补助" =>		 :attribute15, 
          "培训费" =>		 :attribute5
        }],
        "520014019" => ["差旅费-综合部",{
          "出差地点" =>		 :attribute7, 
          "起始日期" =>		 :attribute8, 
          "结束日期" =>		 :attribute9, 
          "车船票" =>		 :attribute10, 
          "飞机票" =>		 :attribute11, 
          "住宿票" =>		 :attribute12, 
          "杂费" =>		 :attribute13, 
          "伙食补助" =>		 :attribute14, 
          "交通补助" =>		 :attribute15
        }],
        "520014020" => ["差旅费-政治工作部（工会办公室）",{
          "出差地点" =>		 :attribute7, 
          "起始日期" =>		 :attribute8, 
          "结束日期" =>		 :attribute9, 
          "车船票" =>		 :attribute10, 
          "飞机票" =>		 :attribute11, 
          "住宿票" =>		 :attribute12, 
          "杂费" =>		 :attribute13, 
          "伙食补助" =>		 :attribute14, 
          "交通补助" =>		 :attribute15
        }],
        "520014021" =>  [
          "差旅费-人力资源部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014022" =>  ["	差旅费-财务管理部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014023" => ["差旅费-审计与内控部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014024" =>  ["	差旅费-监察部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014025" =>  ["	差旅费-物资采购部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014026" =>  ["	差旅费-安全与环境保护监察部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>	 :attribute8, 
            "结束日期" =>			 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014027" =>  ["	差旅费-生产技术部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014028" =>  ["	差旅费-发电运行部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014029" =>  ["	差旅费-设备维护部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014030" =>  ["	差旅费-燃料质量检验中心",
                           {	"出差地点" =>		:attribute7,
                             "起始日期" =>		 :attribute8, 
                             "结束日期" =>		 :attribute9, 
                             "车船票" =>		 :attribute10, 
                             "飞机票" =>		 :attribute11, 
                             "住宿票" =>		 :attribute12, 
                             "杂费" =>		 :attribute13, 
                             "伙食补助" =>		 :attribute14, 
                             "交通补助" =>		 :attribute15
          }],
          "520014031" =>  ["	差旅费-燃料部",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014032" => ["	差旅费-筹建办",{
            "出差地点" =>		 :attribute7, 
            "起始日期" =>		 :attribute8, 
            "结束日期" =>		 :attribute9, 
            "车船票" =>		 :attribute10, 
            "飞机票" =>		 :attribute11, 
            "住宿票" =>		 :attribute12, 
            "杂费" =>		 :attribute13, 
            "伙食补助" =>		 :attribute14, 
            "交通补助" =>		 :attribute15
          }],
          "520014034" => ["会议费",{
            "会议名称" =>		 :attribute7, 
            "	会议地点" =>		 :attribute8, 
            "	会议时间" =>		 :attribute9, 
            "	会议人数" =>		 :attribute10, 
            "	参加人员单位" =>		 :attribute11, 
            "房费" =>		 :attribute12, 
            "餐费" =>		 :attribute13, 
            "会议室租赁费" =>		 :attribute14, 
            "杂费" =>		 :attribute13
          }]
  }

  #费用明细
  def fee_lines
    ret = FEE_HASH[attribute4]
    ret = [] if ret.blank?
    ret
  end

  def wf_notification
    WfNotification.where(["message_type=? and item_key like '?_%'",'APINVAPR',id]).try(:first)
  end

  #工作流标题
  def wf_title
    wf_notification.try(:subject)
  end

  #工作流发起人
  def wf_from_user
    wf_notification.try(:from_user)
  end

  #工作流发起时间
  def wf_begin_date
    wf_notification.try(:begin_date)
  end

  def self.unread_bills(wf_itemkeys)
    # sync_with_ebs(wf_itemkeys)
    self.bills_by_wf_itemkeys(wf_itemkeys).to_json(
      # methods: [:wf_title,:wf_from_user,:wf_begin_date]
    )
  end

  #通过wf_itemkey更新需求数据
  #通知表中ITEM_KEY,去掉"_"以及后的数字，为发票ID
  def self.sync_with_ebs(wf_item_keys)
    ids = []
    wf_item_keys.each do |k|
      id = k.split("_").try(:first)
      if id.present?
        ids << id
        p_item_array =  []
        p_item_array << {
          "VTYPE" => "NUM",
          "VNAME" => "ID",
          "VVALUE" => id,
          "VSIGN" => "EQ"
        }
        TestSoap.sync_table(self,p_item_array)
      end
    end
    CuxApInvoiceLine.sync_with_ebs(ids)
    ApWfapprovalHistory.sync_with_ebs(ids)
    #同步附件
    ids.each do |ap_id|
      CuxSoaAttachedDocV.sync_with_ebs(ap_id,"AP_INVOICES")
    end
  end
  #单位说明
  # 主科目代码	单位
  # 140501010101	吨
  # 140502010101	
  # 500101050101	
  # 500101050201	
  # 140503010101	立方米
  # 600101010101	千千瓦时
  #
  def uom_des
    ret = ""
    ret = "吨" if ["140501010101","140502010101","500101050101","500101050201"].include?(segment3)
    ret = "立方米" if segments.eql?("140503010101")
    ret = "千千瓦时" if segments.eql?("600101010101")
    ret
  end

  def self.audit(user_id,username,p_to_user_id,notification_id,b_pass,audit_note)
    # return {x_ret_code: '0',x_ret_message: '数据处理成功'}
    # ret = plsql.CUX_MOBILE_APP_PVT.GENERAL_APPROVAL(user_id,
    #                                                 username,
    #                                                 notification_id,
    #                                                 b_pass,
    #                                                 audit_note,
    #                                                 user_id)
    #
    #
    response = SoapApproval.general_approval(user_id,username,p_to_user_id,notification_id,b_pass,audit_note,"")
    {x_ret_code: response.body[:output_parameters][:x_ret_code],x_ret_message: response.body[:output_parameters][:x_ret_message]}
  end
end
