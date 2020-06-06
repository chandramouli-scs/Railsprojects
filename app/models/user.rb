class User < ApplicationRecord
	attr_accessor :gauth_token

  #create wallet after create user
  after_create :create_wallet

  #relations
  has_many :newsfeeds
	has_many :projects, dependent: :destroy
	has_many :tasks
  has_many :transactions
  has_one :wallet
	belongs_to :organisation

  #validation 
  validates :user_name, :uniqueness => {:case_sensitive => false}
  validates :user_name, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}, presence: true
  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :phone_number,  presence: true

  devise :google_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable,
         :timeoutable, :trackable

  #if user has no gauth this code generates gauth_secret
  User.where(:gauth_secret => nil).find_each do |user|
   user.send(:assign_auth_secret)
   user.save!
  end

end
