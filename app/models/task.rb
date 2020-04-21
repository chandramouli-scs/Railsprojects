class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user 
  validates :task_name, presence: true
  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_one_attached :photo
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  validates :photo,  presence: true

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
