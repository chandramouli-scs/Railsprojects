class Transaction < ApplicationRecord
	belongs_to :user
	belongs_to :project
  TRANSACTION_TYPES=["approve", "reject"]

  validates :coins, presence: true, numericality: true
end
