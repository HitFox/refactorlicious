class Admin::ExercisesController < Admin::AdminControllerBase
  before_action :set_exercise, only: [:update, :edit]

  def index
    @exercise_categories = ExerciseCategory.all
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to admin_exercises_path, notice: "Exercise was successfully updated"
    else
      flash[:alert] = "Could not save exercise!"
      redirect_to edit_admin_exercise #render does not display the correct url, which is necessary to add ace.js
    end
  end

  def edit
  end

  private

  def exercise_params
    params.require(:exercise).permit(:points, :exercise_category_id, :code_to_refactor, :solution, :key_words, :status)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
