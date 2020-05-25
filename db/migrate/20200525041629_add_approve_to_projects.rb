class AddApproveToProjects < ActiveRecord::Migration[6.0]
  def change
  	add_column :projects, :approved, :boolean, default: false
  end
end
