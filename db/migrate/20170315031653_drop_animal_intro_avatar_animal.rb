class DropAnimalIntroAvatarAnimal < ActiveRecord::Migration[5.0]
  def change
    remove_column :animals, :animal_intro_avatar
  end
end
