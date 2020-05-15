class AddColToperidnonv < ActiveRecord::Migration[6.0]
  def change
  	add_reference :permissions_roles, :permission_id, array:true, default: []
  end
end
