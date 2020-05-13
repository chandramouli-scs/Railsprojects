class RemovePerId < ActiveRecord::Migration[6.0]
  def change
  	remove_column :roles, :permission_id
  end
end
