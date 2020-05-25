class RemoveApprove < ActiveRecord::Migration[6.0]
  def change
  	remove_column :projects, :approved
  end
end
