class CreateExerciseCategories < ActiveRecord::Migration
  def change
    create_table :exercise_categories do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
