class Lab < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :image, presence: true

  acts_as_taggable_on :labels
  acts_as_taggable

  def self.find_labs(page: 1)
    Lab.page(page).per(10)
  end
end
