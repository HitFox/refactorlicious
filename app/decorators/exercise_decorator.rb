class ExerciseDecorator < Draper::Decorator
  delegate_all

  def status
    status = h.current_user.user_exercises_hash[object.id]
    status.present? ? status : status = "not-started"
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

  def icon
    case status
    when "finished" then "icon-star-two"
    when "incomplete" then "icon-star-half"
    when "not-started" then "icon-star"
    end
  end
end
