class AddDbIndexes < ActiveRecord::Migration
  def change
    add_index :user_exercises, :user_id
    add_index :user_exercises, :exercise_id
    add_index :exercises, :exercise_category_id
  end
end
