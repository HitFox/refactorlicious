class Admin::ExercisesController < Admin::AdminControllerBase
  before_action :set_exercise, only: [:update, :edit, :destroy]

  def index
    @exercises = AdminExerciseDecorator.decorate_collection(Exercise.all)
    @filter_items = generate_filter_items
  end

  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.json { render json: @exercise, status: :ok }
        format.html { redirect_to admin_exercises_path, notice: "Exercise was successfully updated" }
      else
        format.json { render json: @exercise.errors, status: :internal_server_error }
        format.html {
          flash[:alert] = "Could not save exercise!"
          render :edit
        }
      end
    end
  end

  def edit
  end

  def destroy
    respond_to do |format|
      if @exercise.destroy
        format.json { render json: @exercise, status: :ok }
       else
        format.json { render json: @exercise.errors, status: :internal_server_error }
      end
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:points, :exercise_category_id, :code_to_refactor, :solution, :key_words, :status)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def generate_filter_items
    filters = {
      "Status" => Exercise.statuses.keys.map{ |k| k.capitalize } ,
      "Category" => ExerciseCategory.all.pluck(:name)
    }
  end
end
