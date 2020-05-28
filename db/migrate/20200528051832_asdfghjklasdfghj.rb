class Asdfghjklasdfghj < ActiveRecord::Migration[6.0]
  def change
  	change_column :wallets, :balance, :integer
  end
end
