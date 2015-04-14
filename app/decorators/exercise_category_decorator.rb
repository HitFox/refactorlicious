class ExerciseCategoryDecorator < Draper::Decorator
  delegate_all
  decorates_association :exercises
end
