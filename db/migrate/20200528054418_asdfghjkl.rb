class Asdfghjkl < ActiveRecord::Migration[6.0]
  def change
  	add_reference :wallets, :project, foreign_key: true
  end
end
