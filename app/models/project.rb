class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/no_image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.find_projects(page: 1)
    Project.page(page).per(10)
  end
end
