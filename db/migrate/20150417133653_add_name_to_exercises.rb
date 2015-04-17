class AddNameToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :name, :string
    add_index :exercises, [:name, :exercise_category_id], unique: true
  end
end
