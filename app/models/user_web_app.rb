class UserWebApp < ActiveRecord::Base
  belongs_to :user
  belongs_to :web_app
end
