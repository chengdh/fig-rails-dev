#coding: utf-8
class AddUserIdToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :user, index: true
  end
end
