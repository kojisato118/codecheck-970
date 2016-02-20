class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :title, :null => false
      t.string :url, :null => false
      t.text :description, :null => false
      t.string :image, :null => false

      t.timestamps null: false
    end
  end
end
