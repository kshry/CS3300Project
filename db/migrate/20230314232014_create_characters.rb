class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :character_class
      t.integer :level
      t.text :description

      t.timestamps
    end
  end
end
