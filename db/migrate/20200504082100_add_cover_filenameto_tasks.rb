class AddCoverFilenametoTasks < ActiveRecord::Migration[6.0]
  def change
  	add_column :tasks, :cover_filename, :string
  end
end
