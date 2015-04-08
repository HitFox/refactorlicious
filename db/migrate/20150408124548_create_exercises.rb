class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :points
      t.string :solution
      t.string :code_to_refactor

      t.timestamps null: false
    end
  end
end
