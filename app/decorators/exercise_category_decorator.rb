class ExerciseCategoryDecorator < Draper::Decorator
  delegate :name
  decorates_association :approved_exercises
end
