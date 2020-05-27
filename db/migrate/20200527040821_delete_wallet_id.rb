class DeleteWalletId < ActiveRecord::Migration[6.0]
  def change
  	remove_column :transactions, :wallet_id
  end
end
