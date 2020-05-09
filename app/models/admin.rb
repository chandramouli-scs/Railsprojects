class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
         belongs_to :role
  validates :email, :uniqueness => {:case_sensitive => false}


  def super_admin?
  	super_admin
  end

  def admin?
  	admin
  end

end
