class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :transactions
  belongs_to :organisation 
  validates :project_name, :uniqueness => {:case_sensitive => false}
  validates :project_name, presence: true

end
