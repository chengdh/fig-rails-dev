class CreateVerifySms < ActiveRecord::Migration
  def change
    create_table :verify_sms do |t|
      t.string :mobile,limit: 60
      t.string :verify_code,limit: 30
      t.string :verity_type,limit: 20,default: 'registeration'
      t.boolean :is_used,default: false

      t.timestamps null: false
    end
  end
end
