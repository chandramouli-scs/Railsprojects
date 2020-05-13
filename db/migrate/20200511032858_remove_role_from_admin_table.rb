class RemoveRoleFromAdminTable < ActiveRecord::Migration[6.0]
  def change
  	remove_column :admins, :role, :string
  end
end
