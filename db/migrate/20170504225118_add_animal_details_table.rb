class AddAnimalDetailsTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :animal_details do |t|
      t.boolean :good_with_cats
      t.boolean :good_with_dogs
      t.integer  :temperment
      t.integer  :health_rating
      t.decimal  :overall_score

      t.references :animal

      t.timestamps
    end

    # add_index :animal_details, :animal_id
  end

  def self.down
    drop_table :animal_details
  end
end
