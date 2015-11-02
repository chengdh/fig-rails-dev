#coding: utf-8
module WebAppsHelper
  def web_apps_for_select
    WebApp.all.map {|app| [app.name,app.id]}
  end
end
