class Role < ApplicationRecord
	has_many :admins
	has_and_belongs_to_many :permissions
end
