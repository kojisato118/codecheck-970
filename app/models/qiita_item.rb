class QiitaItem < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :qiita_item_id, presence: true, uniqueness: true

  acts_as_taggable_on :labels
  acts_as_taggable

  def self.find_qiita_items(page: 1)
    QiitaItem.page(page).per(10)
  end
end
