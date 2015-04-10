module ApplicationHelper
  def difficulty_level(exercise)
    if exercise.points >= 25
      "difficult"
    elsif exercise.points >= 15
      "medium"
    else
      "easy"
    end
  end
end
