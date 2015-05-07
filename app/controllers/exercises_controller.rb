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

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: "You have successfully submitted a new exercise"
    else
      flash[:alert] = "Sorry, but something with your submission went wrong"
      render :new
    end
  end

  def submit
    @answerErrors = Exercise.findSyntaxErrors(params[:answer])
    if (!@answerErrors)
      user_exercise = UserExercise.find_by(user_id: current_user.id, exercise_id: params[:exercise_id])
      user_exercise.update_attribute(:status, "finished")
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:answer, :points, :exercise_category_id, :code_to_refactor, :solution)
  end

end
