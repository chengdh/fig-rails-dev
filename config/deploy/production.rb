# -*- encoding : utf-8 -*-
set :rails_env,     "production"
set :app_env,     "production"

set :application, "nanyang_plat"
set :repo_url,  "https://github.com/chengdh/fig-rails-dev.git"
# set :repo_url,  "https://git.oschina.net/chengdh/fig-rails-dev.git"
# set :branch,"nanyang"
set :branch,"change_assessment_function"
set :scm, :git

#set :password, ask('Server password', nil)
server '10.67.192.116', user: 'rails-dev', port: 22, password: fetch(:password), roles: %w{app web db}


set :deploy_to,"~/app/nanyang_plat"

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
