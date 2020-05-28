class Wehjklsdfghjk < ActiveRecord::Migration[6.0]
  def change
  	remove_column :wallets, :project_id
  end
end
