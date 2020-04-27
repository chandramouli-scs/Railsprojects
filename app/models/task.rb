class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user 
  validates :task_name, presence: true
  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_one_attached :photo
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  validates :photo,  presence: true

end
