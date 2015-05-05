class AddStatusToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :status, :integer, default:0
  end
end
