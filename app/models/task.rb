class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user 
  #validation for task_name
  validates :task_name, presence: true

  #attachment in task creation
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
