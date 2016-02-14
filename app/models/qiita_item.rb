class QiitaItem < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :qiita_item_id, presence: true
end
