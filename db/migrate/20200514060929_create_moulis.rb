class CreateMoulis < ActiveRecord::Migration[6.0]
  def change
    create_table :moulis do |t|

      t.timestamps
    end
  end
end
