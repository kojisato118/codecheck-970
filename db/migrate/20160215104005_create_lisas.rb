class CreateLisas < ActiveRecord::Migration
  def change
    create_table :lisas do |t|
      t.string :title, :null => false
      t.string :description, :null => false
      t.string :url, :null => false
      t.string :image, :null => false
      t.integer :lisa_id, :null => false

      t.timestamps null: false
    end

    add_index :lisas, :lisa_id, unique: true
  end
end
