class AddArrayToRole < ActiveRecord::Migration[6.0]
  def change
  	add_column :roles, :permission_id, :integer, array:true, default: []
  end
end
