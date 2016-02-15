class Lisa < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :image, presence: true
  validates :lisa_id, presence: true, uniqueness: true

  def self.find_lisas(page: 1)
    Lisa.page(page).per(10)
  end
end
