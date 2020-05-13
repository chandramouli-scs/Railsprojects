class RemoveRight < ActiveRecord::Migration[6.0]
  def change
  	remove_column :admins, :right, :string
  end
end
