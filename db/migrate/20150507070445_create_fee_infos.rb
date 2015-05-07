class CreateFeeInfos < ActiveRecord::Migration
  def change
    create_table :fee_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.date :fee_date
      t.decimal :cr
      t.decimal :dr
      t.string :note

      t.timestamps null: false
    end
  end
end
