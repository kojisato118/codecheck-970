class Lisa < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :image, presence: true
  validates :lisa_id, presence: true, uniqueness: true
end
