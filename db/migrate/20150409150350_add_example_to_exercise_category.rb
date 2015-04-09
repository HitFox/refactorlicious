class AddExampleToExerciseCategory < ActiveRecord::Migration
  def change
    add_column :exercise_categories, :example, :string
  end
end
