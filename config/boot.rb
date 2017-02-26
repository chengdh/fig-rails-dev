ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

#ENV['NLS_LANG'] = 'AMERICAN_AMERICA.UTF8'
# FIXME 必须设置 否则启动工作流时会报错
ENV['NLS_LANG'] =  'SIMPLIFIED CHINESE_CHINA.ZHS16GBK'
ENV['NLS_NCHAR_CHARACTERSET'] = 'AL16UTF16'
ENV['NLS_CHARACTERSET'] = 'UTF8'
ENV['NLS_DATE_FORMAT'] = 'DD-MON-RR'
ENV['NLS_LENGTH_SEMANTICS'] = 'BYTE'
require 'bundler/setup' # Set up gems listed in the Gemfile.
