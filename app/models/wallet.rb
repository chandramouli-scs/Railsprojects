class Wallet < ApplicationRecord
  has_many :transactions
  belongs_to :user

  validates :balance, presence: true, numericality: true

  before_validation :load_defaults

  def load_defaults
  	if self.new_record?
  		self.balance = 0
  	end
  end

end
