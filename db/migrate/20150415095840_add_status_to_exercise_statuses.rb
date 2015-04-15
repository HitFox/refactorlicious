class AddStatusToExerciseStatuses < ActiveRecord::Migration
  def change
    add_column :exercise_statuses, :status, :integer, default: 0
  end
end
