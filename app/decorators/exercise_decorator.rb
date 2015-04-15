class ExerciseDecorator < Draper::Decorator
  delegate_all

  def status
    status = h.current_user.exercise_status_hash[object.id]
    if (status.nil?)
      status = "not started"
    end
    return status
  end

  def difficulty_level
    if points >= 25
      "difficult"
    elsif points >= 15
      "medium"
    else
      "easy"
    end
  end
  
end
