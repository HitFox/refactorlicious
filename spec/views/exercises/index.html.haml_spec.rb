require "rails_helper"

describe 'exercises/index.html.haml' do

  context "On exercises index" do

    let(:exercise_category) { create(:exercise_category) }
    let!(:exercise) { create(:exercise, points: 15, exercise_category_id: exercise_category.id)}
    let!(:another_exercise) { create(:exercise, points: 20, exercise_category_id: exercise_category.id) }

    before :each do
      assign(:exercise_categories, ExerciseCategory.all)
      render
    end

    #this can no longer be a view test, because generating the view involves a user to be logged in an
    #and using the draper gem to decorate the exercise model adding the status of the exercises (started, finished...)
    #the corresponding controller tests and feature tests are pending
    xit "shows the points for each exercise" do
      expect(rendered).to have_content "15"
      expect(rendered).to have_content "20"
    end

    xit "assigns alphabetical letters to each exercise" do
      expect(rendered).to have_content "A"
      expect(rendered).to have_content "B"
    end
  end

end
