#coding: utf-8
#验证短信
class VerifySm < ActiveRecord::Base
  default_value_for :verify_code do
    Random.new.rand(100000..999999).to_s
  end
  default_scope {order("created_at DESC")}

  #发送验证短信
  def send_verify_sms
    http_client = HTTPClient.new
    request_url = Settings.sms_service.server_url
    params = {
      account:  Settings.sms_service.username,
      pswd:     Settings.sms_service.password,
      mobile:   self.mobile,
      msg:      "您的注册验证码是: #{self.verify_code}.请完成注册",
      needstatus:   true
    }
    http_client.post(request_url,params)
  end
  #发送验证短信
  def send_reset_password_sms
    http_client = HTTPClient.new
    request_url = Settings.sms_service.server_url
    params = {
      account:  Settings.sms_service.username,
      pswd:     Settings.sms_service.password,
      mobile:   self.mobile,
      msg:      "您的验证码是: #{self.verify_code}.请勿泄漏",
      needstatus:   true
    }
    http_client.post(request_url,params)
  end
end
