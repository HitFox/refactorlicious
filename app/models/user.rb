class User < ActiveRecord::Base
  has_many :exercise_statuses
  has_many :exercises, through: :exercise_statuses
end
