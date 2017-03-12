class AddCachedCommentCountToAnimal < ActiveRecord::Migration[5.0]
  def change
    add_column :animals, :comments_count, :integer, :default => 0
    add_index  :animals, :comments_count
  end
end
