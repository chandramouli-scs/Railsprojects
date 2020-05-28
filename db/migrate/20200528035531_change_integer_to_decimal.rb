class ChangeIntegerToDecimal < ActiveRecord::Migration[6.0]
  def change
  	change_column :wallets, :balance, :decimal
  end
end
