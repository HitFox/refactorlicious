require 'rails_helper'

describe ExercisesController do
  let!(:user) {create(:user)}
  let!(:exercise) {create(:exercise)}
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

  describe "POST #create" do
    context "with valid params" do
      it "creates a new exercise" do
        expect {
          post :create, exercise: attributes_for(:exercise)
        }.to change(Exercise, :count).by 1
      end

      it "redirects to the exercises index" do
        post :create, exercise: attributes_for(:exercise)
        expect(response).to redirect_to(exercises_path)
      end
    end

    context "with invalid params" do
      it "does not create a new exercise" do
        expect {
          post :create, exercise: attributes_for(:invalid_exercise)
        }.to change(Exercise, :count).by 0
      end

      it "render the new template" do
        post :create, exercise: attributes_for(:invalid_exercise)
        expect(response).to render_template :new
      end
    end
  end
end
