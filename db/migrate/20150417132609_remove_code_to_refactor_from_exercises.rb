class RemoveCodeToRefactorFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :code_to_refactor, :string
  end
end
