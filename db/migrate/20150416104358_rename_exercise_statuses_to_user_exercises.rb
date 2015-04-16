class RenameExerciseStatusesToUserExercises < ActiveRecord::Migration
  def change
    rename_table :exercise_statuses, :user_exercises
  end
end
