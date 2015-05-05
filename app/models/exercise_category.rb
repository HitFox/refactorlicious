class ExerciseCategory < ActiveRecord::Base
  has_many :exercises, dependent: :destroy
  has_many :approved_exercises, -> { where(status: Exercise.statuses[:approved]) }, class_name: "Exercise", dependent: :destroy
  has_many :drafted_exercises, -> { where(status: Exercise.statuses[:drafted]) }, class_name: "Exercise", dependent: :destroy
  has_many :rejected_exercises, -> { where(status: Exercise.statuses[:rejected]) }, class_name: "Exercise", dependent: :destroy

  def has_exercises?(type = "")
    if type == ""
      !exercises.empty?
    else
      !send("#{type}_exercises".to_sym).empty?
    end
  end
end
