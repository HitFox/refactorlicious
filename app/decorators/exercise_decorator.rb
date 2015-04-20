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
    file_content.split("#SOLUTION")[0].strip
  end

  def solution
    file_content.split("#SOLUTION")[1].strip
  end
  private

  def file_content
    @base_path ||= "#{EXERCISES_PATH}#{object.exercise_category.name.downcase.gsub(' ', '_')}_#{object.id}.rb"
    @file_content ||= File.open(@base_path).read
  end

end
