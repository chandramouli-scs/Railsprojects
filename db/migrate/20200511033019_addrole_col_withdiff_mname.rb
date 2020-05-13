class AddroleColWithdiffMname < ActiveRecord::Migration[6.0]
  def change
  	add_column :admins, :right, :string, default: false 
  end
end
