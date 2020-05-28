class ChangeIntegerToDecimalNew < ActiveRecord::Migration[6.0]
  def change
  	change_column :transactions, :instance_bal, :decimal
  	change_column :transactions, :coins, :decimal
  end
end
