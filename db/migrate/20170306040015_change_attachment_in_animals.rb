class ChangeAttachmentInAnimals < ActiveRecord::Migration[5.0]
  def change
    rename_column :animals, :attachment, :animal_intro_avatar
  end
end
