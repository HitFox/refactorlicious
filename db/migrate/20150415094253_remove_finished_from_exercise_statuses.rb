class RemoveFinishedFromExerciseStatuses < ActiveRecord::Migration
  def change
    remove_column :exercise_statuses, :finished, :boolean
  end
end
