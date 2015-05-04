#coding: utf-8
class RegisterInfo < ActiveRecord::Base
  validates :company_name,:legal_code,:address,
    :legaler,:project_manager,:pm_phone,:capital,
    :register_date,:income_2012,:profit_2012,
    :employees_count_2012,:asset_2012,:pure_asset_2012,
    :project_name,:project_context,:project_kpi,:project_belongs,
    :project_begin_date,:project_end_date,
    presence: true

  validates :capital,:income_2012,:profit_2012,
    :employees_count_2012,:asset_2012,:pure_asset_2012,
    :tax_2011,:tax_2012,:profit_pure_asset_2012,:profit_flow_asset_2012,
    :project_sum_invest,:project_sum_invest_self,
    :project_sum_apply,
    :project_already_invest_2012,
    :project_already_invest_2013,
    numericality: {greater_than_or_equal_to: 0.0}

    #营业执照
    has_attached_file :attach_1, :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"
    #组织机构代码证

    has_attached_file :attach_2, :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"

    #税务登记证
    has_attached_file :attach_3, :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"

    #法人代表身份证
    has_attached_file :attach_4, :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"

    #资信证明
    has_attached_file :attach_5, :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"

    #项目实施方案及可行性报告(电子版) 
    has_attached_file :attach_6

    #项目资金证明(电子版)
    has_attached_file :attach_7

    #申报资金项目承诺书(扫描件)
    has_attached_file :attach_8
    #其他相关证明材料(可打包)
    has_attached_file :attach_9


    validates_attachment_content_type :attach_1, presence: true, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :attach_2, presence: true,:content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :attach_3, presence: true,:content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :attach_4, presence: true,:content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :attach_5, presence: true,:content_type => /\Aimage\/.*\Z/
end
