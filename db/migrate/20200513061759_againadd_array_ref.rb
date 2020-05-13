class AgainaddArrayRef < ActiveRecord::Migration[6.0]
  def change
  	add_reference :roles, :permission, array:true, default: []
  end
end
