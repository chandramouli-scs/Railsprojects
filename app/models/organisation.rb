class Organisation < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :projects, dependent: :destroy 
	validates :organisation_name, :uniqueness => {:case_sensitive => false}
	validates :organisation_name, presence: true

end
