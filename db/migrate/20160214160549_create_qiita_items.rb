class CreateQiitaItems < ActiveRecord::Migration
  def change
    create_table :qiita_items do |t|
      t.string :qiita_item_id, :null => false
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :url, :null => false
      t.string :image

      t.timestamps null: false
    end
  end
end
