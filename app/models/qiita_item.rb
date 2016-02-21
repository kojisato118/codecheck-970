class QiitaItem < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :qiita_item_id, presence: true, uniqueness: true

  acts_as_taggable_on :labels
  acts_as_taggable

  # TODO: 何かいい感じのproject定数
  LOWER_LIMIT_OF_PER = 3

  def self.find_qiita_items(page: 1, per: 5)
    if per < LOWER_LIMIT_OF_PER
      per = LOWER_LIMIT_OF_PER
    end

    QiitaItem.page(page).per(per)
  end
end
