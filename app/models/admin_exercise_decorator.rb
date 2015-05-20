class AdminExerciseDecorator < Draper::Decorator
  delegate_all

  def attributes
    super.merge('category' => self.category)
  end

end
