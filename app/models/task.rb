class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  def self.to_csv
    attributes = %w{id task_name}
		CSV.generate do |csv|
  		csv << attributes
  		all.each do |task|
  			csv << task.attributes.values_at(*attributes)
  		end
  	end
  end
end
