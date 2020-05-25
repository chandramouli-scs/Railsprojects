class AddingAprroveNotBoolean < ActiveRecord::Migration[6.0]
  def change
  	add_column :projects, :approved, :string, default: "pending"
  end
end
