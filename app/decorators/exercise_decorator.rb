class ExerciseDecorator < Draper::Decorator
  delegate_all

  def status
    status = h.current_user.user_exercises_hash[object.id]
    status.present? ? status : status = "not started"
  end
end
