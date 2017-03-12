class ChangeAnimalAvatarDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :animals, :animal_intro_avatar, :string
  end
end
