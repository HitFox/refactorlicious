module ExercisesHelper
  def prev_exercise
    prev_exercise = Exercise.find_by(id: @exercise.id - 1)
    if prev_exercise
      prev_exercise
    else
      @exercise
    end
  end

  def next_exercise
    next_exercise = Exercise.find_by(id: @exercise.id + 1)
    if next_exercise
      next_exercise
    else
      @exercise
    end
  end
end
