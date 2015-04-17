class ExerciseDecorator < Draper::Decorator
  EXERCISES_PATH = "#{Rails.root}/app/assets/exercises/"
  delegate_all

  def status
    status = h.current_user.user_exercises_hash[object.id]
    status.present? ? status : status = "not started"
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

  def code_to_refactor
    File.open(code_to_refactor_path).read
  end

  def solution
    File.open(solution_path).read
  end
  private

  def base_path
    @base_path ||= "#{EXERCISES_PATH}#{object.exercise_category.name.downcase.gsub(' ', '_')}/#{object.name}"
  end

  def code_to_refactor_path
    "#{base_path}.rb"
  end

  def solution_path
    "#{base_path}_sol.rb"
  end
end
