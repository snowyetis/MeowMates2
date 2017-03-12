class AddCachedVotesToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_column :animals, :cached_votes_up, :integer, :default => 0
    add_index  :animals, :cached_votes_up
  end
end
