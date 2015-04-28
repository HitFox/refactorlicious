class Admin::ExercisesController < Admin::AdminControllerBase
  def index
    @exercise_categories = ExerciseCategory.all
  end

  def update
    @exercies = Exercise.new(exercise_params)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:points, :exercise_category_id, :code_to_refactor, :solution)
  end
end
