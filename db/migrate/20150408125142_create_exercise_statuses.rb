class CreateExerciseStatuses < ActiveRecord::Migration
  def change
    create_table :exercise_statuses do |t|
      t.integer :exercise_id
      t.integer :user_id
      t.boolean :finished, default: false

      t.timestamps null: false
    end
  end
end
