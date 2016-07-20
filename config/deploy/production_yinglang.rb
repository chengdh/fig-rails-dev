# -*- encoding : utf-8 -*-
set :rails_env,     "production"
set :app_env,     "production"

set :application, "yinglang-sport-server"
#set :repo_url,  "https://github.com/chengdh/fig-rails-dev.git"
set :repo_url, "https://git.oschina.net/chengdh/fig-rails-dev.git"
set :branch,"yinglang-sport-server"
set :scm, :git

#set :password, ask('Server password', nil)
#server '122.0.76.160', user: 'yinglang-sport-app', port: 22, password: fetch(:password), roles: %w{app web db}
#server '106.187.53.155', user: 'yinglang-port-app', port: 22, password: fetch(:password), roles: %w{app web db}
server '203.110.165.236', user: 'yinglang-sport-app', port: 3596, password: fetch(:password), roles: %w{app web db}


set :deploy_to,"~/app/yinglang-sport-server"
set :default_env, { 
   "LD_LIBRARY_PATH" => "/usr/lib/oracle/12.1/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
}
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.4'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
