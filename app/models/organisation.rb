class Organisation < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :projects, dependent: :destroy 
	validates :organisation_name, :uniqueness => {:case_sensitive => false}
	validates :organisation_name, presence: true

	def self.to_csv
		attributes = %w{id organisation_name}
		CSV.generate do |csv|
  		csv << attributes
  		all.each do |organisation|
  			csv << organisation.attributes.values_at(*attributes)
  		end
  	end
	end
end
