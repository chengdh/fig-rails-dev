# fig-rails-dev
基于docker fig 的rails开发环境
使用方法参考Getting started with Fig and Rails
# 定时从erp同步数据
*/5 * * * * dokku enter guodiantou-app-server bundle exec rails runner "UsersLogin.sync_with_ebs"
*/5 * * * * docker-compose run guodiantou-app-server bundle exec rails runner "UsersLogin.sync_all"
