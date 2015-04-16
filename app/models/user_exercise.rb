class UserExercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  enum status: { incomplete: 0 , finished: 1 }
end
