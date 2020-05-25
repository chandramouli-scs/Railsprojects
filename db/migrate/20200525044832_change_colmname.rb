class ChangeColmname < ActiveRecord::Migration[6.0]
  def change
  	rename_column :projects, :approved, :status
  end
end
