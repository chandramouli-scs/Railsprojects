class AddRight1New < ActiveRecord::Migration[6.0]
  def change
  	add_column :admins, :rightq, :string
  end
end
