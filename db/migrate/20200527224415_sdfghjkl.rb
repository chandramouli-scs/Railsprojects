class Sdfghjkl < ActiveRecord::Migration[6.0]
  def change
  	add_column :transactions, :instance_bal, :integer
  end
end
