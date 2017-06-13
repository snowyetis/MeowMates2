class AddResqueTmpColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar_tmp, :string
    add_column :users, :cover_tmp, :string
    add_column :animals, :animal_intro_avatar_tmp, :string
  end
end
