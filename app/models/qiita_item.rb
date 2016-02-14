class QiitaItem < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :qiita_item_id, presence: true, uniqueness: true

  def self.find_qiita_items(page: 1)
    QiitaItem.page(page).per(10)
  end
end
