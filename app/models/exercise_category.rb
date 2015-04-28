class ExerciseCategory < ActiveRecord::Base
  has_many :exercises, dependent: :destroy
  has_many :approved_exercises, -> { where(status: Exercise.statuses[:approved]) }, class_name: "Exercise", dependent: :destroy
end
