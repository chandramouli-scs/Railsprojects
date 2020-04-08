class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :organisation_name

      t.timestamps
    end
  end
end
