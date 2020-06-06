class Transaction < ApplicationRecord
	belongs_to :user
	belongs_to :project
  TRANSACTION_TYPES=["approve", "reject"]
  #validation for coins
  validates :coins, presence: true, numericality: true
end
