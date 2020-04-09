class Organisation < ApplicationRecord
	has_many :users
	has_many :projects

	def self.to_csv
		CSV.generate do |csv|
  		csv << column_names
  		all.each do |admin|
  			csv << admin.attributes.values_at(*column_names)
  		end
  	end
	end
end
