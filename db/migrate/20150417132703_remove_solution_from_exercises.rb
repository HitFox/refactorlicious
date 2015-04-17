class RemoveSolutionFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :solution, :string
  end
end
