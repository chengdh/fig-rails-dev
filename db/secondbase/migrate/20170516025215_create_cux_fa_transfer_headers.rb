#coding: utf-8
#固定资产转移
class CreateCuxFaTransferHeaders < ActiveRecord::Migration
  def change
    create_table :cux_fa_transfer_headers_a,id: false do |t|
      t.integer :header_id
      t.date    :request_date
      t.string  :request_full_name
      t.string :request_remark
      t.string :assigned_f_full_name
      t.string :assigned_t_full_name
      t.string :used_department_from_disp
      t.string :used_department_to_disp
      t.string :approved_status_disp
      t.date :creation_date
      t.date :last_update_date
      t.string :item_key

      t.timestamps null: false
    end
  end
end
