class AddAvatarToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_column :animals, :animal_intro_avatar, :string
  end
end
