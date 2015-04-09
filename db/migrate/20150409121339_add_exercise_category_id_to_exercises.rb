class AddExerciseCategoryIdToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :exercise_category_id, :integer
  end
end
