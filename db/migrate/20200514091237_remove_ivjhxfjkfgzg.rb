class RemoveIvjhxfjkfgzg < ActiveRecord::Migration[6.0]
  def change
  	remove_column :permissions_roles, :permission_id
  end
end
