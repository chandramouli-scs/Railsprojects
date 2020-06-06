class Admin < ApplicationRecord

  attr_accessor :gauth_token

  devise :google_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #relations
  belongs_to :role
  
  #email validation
  validates :email, :uniqueness => {:case_sensitive => false}

  #if admin has no gauth this code generates gauth_secret
  Admin.where(:gauth_secret => nil).find_each do |admin|
   admin.send(:assign_auth_secret)
   admin.save!
  end

  #is admin condition
  def admin?
    admin
  end

end