class Transaction < ApplicationRecord
  belongs_to :wallet

  validates :coins, presence: true, numericality: true
end
