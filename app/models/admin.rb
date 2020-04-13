class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  validates :email, :uniqueness => {:case_sensitive => false}

  def self.to_csv
    attributes = %w{id email}
  	CSV.generate do |csv|
  		csv << attributes
  		all.each do |admin|
  			csv << admin.attributes.values_at(*attributes)
  		end
  	end
  end
end
