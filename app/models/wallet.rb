class Wallet < ApplicationRecord
  
  #relations
  belongs_to :user

  #validation
  validates :balance, presence: true, numericality: true

  #loads load_defaults before validation
  before_validation :load_defaults

  #set balance to zero if new wallet is created
  def load_defaults
  	if self.new_record?
  		self.balance = 0
  	end
  end

end
