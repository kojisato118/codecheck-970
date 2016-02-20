class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  acts_as_taggable_on :labels
  acts_as_taggable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/no_image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # TODO: 何かいい感じのproject定数
  LOWER_LIMIT_OF_PER = 3

  def self.find_projects(page: 1, per: 5)
    if per < LOWER_LIMIT_OF_PER
      per = LOWER_LIMIT_OF_PER
    end

    Project.page(page).per(per)
  end
end
