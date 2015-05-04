# -*- encoding : utf-8 -*-
set :rails_env,     "production"
set :app_env,     "production"

set :application, "shangwuju"
set :repo_url,  "git@github.com:chengdh/fig-rails-dev.git"
set :branch,"shangwuju"
set :scm, :git

#set :password, ask('Server password', nil)
server '106.186.18.163', user: 'jinshuiyuan', port: 22, password: fetch(:password), roles: %w{app web db}


set :deploy_to,"~/app/shangwuju"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.4'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

after 'deploy:publishing', 'deploy:restart'
