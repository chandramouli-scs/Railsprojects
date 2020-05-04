class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user 
  validates :task_name, presence: true
  # has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # has_one_attached :photo
  # validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  # validates :photo,  presence: true

  attr_accessor :cover
  after_save :save_cover_image, if: :cover

  def save_cover_image
  	filename = cover.original_filename
  	folder = "public/tasks/#{id}"

  	FileUtils::mkdir_p folder

  	f = File.open File.join(folder, filename), "wb"
  	 f.write cover.read()
  	 f.close

  	 self.cover = nil
  	 update cover_filename: filename
  end

end
