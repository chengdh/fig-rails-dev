#coding: utf-8
class WfNotification < ActiveRecord::Base
  self.table_name = "wf_notifications_a"
  scope :unread,-> (user_id) {where(status: 'OPEN',fuser_id: user_id)}

  def self.sync_with_ebs(user_id)
    p_item_array = [
      {
        "VTYPE" => "NUM",
        "VNAME" => "fuser_id",
        "VVALUE" => user_id,
        "VSIGN" => "EQ"
      },
      {
        "VTYPE" => "VAR",
        "VNAME" => "status",
        "VVALUE" => "OPEN",
        "VSIGN" => "EQ"
      }
    ]
    TestSoap.sync_table(self,p_item_array)
    # response = TestSoap.get_soa_common_data(self.table_name.upcase,p_item_array)
    # business_result = Hash.from_xml(response.body[:output_parameters][:get_soa_common_data])["BUSINESS_RESULT"]
    # list = business_result["BUSINESS_DATA_LIST"]["BUSINESS_DATA"]
    # list.each do |record|
    #   #删除不需要的属性
    #   record.delete_if {|k,v| !WfNotification.column_names.include?(k.downcase)}
    #   id = record.delete("ID")
    #   new_hash = {}
    #   record.each do |k,v|
    #     new_hash.merge!({k.downcase => v})
    #   end
    #   #如果存在数据则更新
    #   wf_exists = WfNotification.exists?(id)
    #   if wf_exists
    #     wf.update_attributes(new_hash,"id=#{id}")
    #   else
    #     wf = WfNotification.new(new_hash)
    #     wf.id = id
    #     wf.save!
    #   end
    # end
  end
end
