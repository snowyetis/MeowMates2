class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :animalName
      t.string :gender
      t.string :age
      t.date :dob
      t.boolean :shots
      t.boolean :fixed
      t.text :content, null: false
      t.references :user, index: true
      t.string :attachment

      t.timestamps
    end
  end
end
