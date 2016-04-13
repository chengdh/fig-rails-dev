class AddCheckStateToAccidentHeader < ActiveRecord::Migration
  def change
    add_column :accident_headers, :check_state, :string,limit: 30 ,default: 'draft'
  end
end
