class Lab < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :image, presence: true, format: /\A#{URI::regexp(%w(http https))}.*(png|jpg|jpeg|gif).*\z|\/images\/medium\/no_image.png/

  acts_as_taggable_on :labels
  acts_as_taggable

  # TODO: 何かいい感じのproject定数
  LOWER_LIMIT_OF_PER = 3

  def self.find_labs(page: 1, per: 5)
    if per < LOWER_LIMIT_OF_PER
      per = LOWER_LIMIT_OF_PER
    end

    Lab.page(page).per(per)
  end
end
