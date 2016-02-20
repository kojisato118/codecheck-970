class Lisa < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :image, presence: true
  validates :lisa_id, presence: true, uniqueness: true

  acts_as_taggable_on :labels
  acts_as_taggable

  def self.find_lisas(page: 1)
    Lisa.page(page).per(10)
  end
end
