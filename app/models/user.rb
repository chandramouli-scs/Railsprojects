class User < ApplicationRecord
  has_many :newsfeeds
	has_many :projects, dependent: :destroy
	has_many :tasks
	belongs_to :organisation 
  validates :user_name, :uniqueness => {:case_sensitive => false}
  validates :user_name, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}, presence: true
  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :phone_number,  presence: true
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable,
         :timeoutable, :trackable

  def self.to_csv
    attributes = %w{id email first_name last_name phone_number user_name}
		CSV.generate do |csv|
  		csv << attributes
  		all.each do |user|
  			csv << user.attributes.values_at(*attributes)
  		end
  	end
  end
  
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.user_name = auth.info.name   # assuming the user model has a name
  end
end

end
