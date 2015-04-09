class Exercise < ActiveRecord::Base
  has_many :exercise_statuses
  has_many :users, through: :exercise_statuses
  belongs_to :exercise_category
end
