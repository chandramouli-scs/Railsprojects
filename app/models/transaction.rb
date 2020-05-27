class Transaction < ApplicationRecord
	belongs_to :user
  TRANSACTION_TYPES=["approve", "reject"]

  validates :coins, presence: true, numericality: true
end
