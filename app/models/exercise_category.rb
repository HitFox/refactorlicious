class ExerciseCategory < ActiveRecord::Base
  has_many :exercises
end
