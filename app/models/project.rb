class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  belongs_to :organisation
  def self.to_csv
    attributes = %w{id project_name}
		CSV.generate do |csv|
  		csv << attributes
  		all.each do |project|
  			csv << project.attributes.values_at(*attributes)
  		end
  	end
  end
end
