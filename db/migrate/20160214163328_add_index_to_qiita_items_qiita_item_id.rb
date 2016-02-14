class AddIndexToQiitaItemsQiitaItemId < ActiveRecord::Migration
  def change
    add_index :qiita_items, :qiita_item_id, unique: true
  end
end
