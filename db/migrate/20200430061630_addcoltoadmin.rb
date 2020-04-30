class Addcoltoadmin < ActiveRecord::Migration[6.0]
  def change
  	add_column :admins, :moderator, :boolean, default: false
  end
end
