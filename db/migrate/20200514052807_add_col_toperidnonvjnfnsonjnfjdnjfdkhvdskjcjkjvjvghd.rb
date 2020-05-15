class AddColToperidnonvjnfnsonjnfjdnjfdkhvdskjcjkjvjvghd < ActiveRecord::Migration[6.0]
  def change
  	add_reference :permissions_roles, :permission, array:true, default: []
  end
end
