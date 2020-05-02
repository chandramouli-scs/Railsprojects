class Addrolestoadmins2 < ActiveRecord::Migration[6.0]
  def change
  	add_column :admins, :role, :string, default: false
  end
end
