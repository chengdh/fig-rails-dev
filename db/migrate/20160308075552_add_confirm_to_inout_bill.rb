class AddConfirmToInoutBill < ActiveRecord::Migration
  def change
    add_column :inout_bills, :confirmer_id, :integer
    add_column :inout_bills, :confirm_date, :date
  end
end
