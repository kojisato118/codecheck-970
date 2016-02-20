class Lab < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :image, presence: true

  acts_as_taggable_on :labels
  acts_as_taggable
end
