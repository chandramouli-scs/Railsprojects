class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  belongs_to :organisation 
  validates :project_name, :uniqueness => {:case_sensitive => false}
  validates :project_name, presence: true
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
