class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    exercise_categories = ExerciseCategory.includes(:exercises).all
    @decorated_exercise_categories = ExerciseCategoryDecorator.decorate_collection(exercise_categories)
  end

  def show
    @exercise = Exercise.find(params[:id])
  end
end
