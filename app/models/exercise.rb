class Exercise < ActiveRecord::Base
  has_many :user_exercises
  has_many :users, through: :user_exercises
  belongs_to :exercise_category

  validates_presence_of :solution, :code_to_refactor, :points
end
