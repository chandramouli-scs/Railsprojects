class AddIdToProjects < ActiveRecord::Migration[6.0]
  def change
  	add_reference :projects, :organisation, foreign_key: true
  end
end
