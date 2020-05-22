class Admin < ApplicationRecord
	attr_accessor :gauth_token
  attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :google_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         belongs_to :role
  validates :email, :uniqueness => {:case_sensitive => false}


  Admin.where(:gauth_secret => nil).find_each do |admin|
   admin.send(:assign_auth_secret)
   admin.save!
  end

  def admin?
    admin
  end

end