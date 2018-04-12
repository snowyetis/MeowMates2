class CreateAnimalAdoptions < ActiveRecord::Migration[5.0]
  def change
        create_table :adoption_animals do |t|
          t.string :species
          t.string :name
          t.string :pet_id
          t.string :gender
          t.boolean :fixed
          t.string :breed
          t.date :found_on
          t.timestamp :scraped_at
          t.references :shelter, index: true
          t.references :image, index: true

          t.timestamps
        end
        add_index :adoption_animals, :species
        add_index :adoption_animals, :pet_id
        add_index :adoption_animals, :gender
        add_index :adoption_animals, :fixed
        add_index :adoption_animals, :breed
  end
end
