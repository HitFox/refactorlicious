class ExerciseDecorator < Draper::Decorator
  delegate_all

  def user_progress
    user_progress = h.current_user.user_exercises_hash[object.id]
    user_progress.present? ? user_progress : user_progress = "not-started"
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

  def icon_class
    case user_progress
    when "finished" then "icon-star-two"
    when "incomplete" then "icon-star-half"
    when "not-started" then "icon-star"
    end
  end
end
