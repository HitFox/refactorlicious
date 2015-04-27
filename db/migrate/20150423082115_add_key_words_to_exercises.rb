class AddKeyWordsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :key_words, :string
  end
end
