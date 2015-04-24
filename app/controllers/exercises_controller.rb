class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    exercise_categories = ExerciseCategory.includes(:exercises).all
    @decorated_exercise_categories = ExerciseCategoryDecorator.decorate_collection(exercise_categories)
  end

  def show
    @exercise = Exercise.find(params[:id])
    UserExercise.find_or_create_by(user_id: current_user.id, exercise_id: @exercise.id)
  end

  def update
    user_exercise = UserExercise.find_by(user_id: current_user.id, exercise_id: params[:id])
    user_exercise.update_attribute(:status, "finished")
    render nothing: true
  end
end
