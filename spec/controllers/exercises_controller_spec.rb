require 'rails_helper'

describe ExercisesController do
  let!(:user) {create(:user)}
  let!(:exercise) {create(:inline_method_exercise)}
  before :each do
    login_user (user)
  end

  describe "PATCH update" do
    before :each do
      get :show, id: exercise.id
    end

    it "changes exercise status to finished" do
      patch :mark_as_finished, exercise_id: exercise.id
      user_exercise = UserExercise.find_by(user_id: user.id, exercise_id: exercise.id)
      expect(user_exercise.status).to eq ("finished")
    end
  end

  describe "GET #show" do
    it "renders the exercise :show view" do
      get :show, id: exercise.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #index" do
    it "renders the exercises :index view" do
      get :index
      expect(assigns(:decorated_exercise_categories).size).to eq 1
    end
  end
end
