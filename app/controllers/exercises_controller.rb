class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercise_categories = ExerciseCategory.all
  end

  def show
    @exercise = Exercise.find_by_id(params[:id])
  end
end
