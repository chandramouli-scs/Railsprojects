class Admin < ApplicationRecord
	attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :google_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
         belongs_to :role
  validates :email, :uniqueness => {:case_sensitive => false}




  def admin?
  	admin
  end

end
