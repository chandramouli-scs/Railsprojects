class AddColToperidnonvjnfnsonjnfjdnjfdkhvdskjcjkjvjvghdehrhirgljvdkuvdsoihjfskhjdgiokvgichjkl < ActiveRecord::Migration[6.0]
  def change
  	add_column :permissions_roles, :permission_id, :integer, array:true, default: []
  end
end
