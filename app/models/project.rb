class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  belongs_to :organisation
end
