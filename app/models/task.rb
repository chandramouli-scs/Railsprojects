class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  def self.to_csv
		CSV.generate do |csv|
  		csv << column_names
  		all.each do |task|
  			csv << task.attributes.values_at(*column_names)
  		end
  	end
  end
end
