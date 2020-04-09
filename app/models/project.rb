class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  belongs_to :organisation
  def self.to_csv
		CSV.generate do |csv|
  		csv << column_names
  		all.each do |project|
  			csv << project.attributes.values_at(*column_names)
  		end
  	end
  end
end
