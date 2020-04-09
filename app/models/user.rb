class User < ApplicationRecord
	has_many :projects
	has_many :tasks
	belongs_to :organisation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.to_csv
    attributes = %w{id email first_name last_name phone_number user_name}
		CSV.generate do |csv|
  		csv << attributes
  		all.each do |user|
  			csv << user.attributes.values_at(*attributes)
  		end
  	end
  end
end
