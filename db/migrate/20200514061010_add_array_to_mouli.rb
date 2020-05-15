class AddArrayToMouli < ActiveRecord::Migration[6.0]
  def change
  	add_column :moulis, :test, :integer, array:true, default: []
  end
end
