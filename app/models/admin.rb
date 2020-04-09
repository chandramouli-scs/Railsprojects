class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.to_csv
  	CSV.generate do |csv|
  		csv << column_names
  		all.each do |admin|
  			csv << admin.attributes.values_at(*column_names)
  		end
  	end
  end
end
