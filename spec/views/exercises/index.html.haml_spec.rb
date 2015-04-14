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

    it "shows the points for each exercise" do
      expect(rendered).to have_content "15"
      expect(rendered).to have_content "20"
    end

    it "assigns alphabetical letters to each exercise" do
      expect(rendered).to have_content "A"
      expect(rendered).to have_content "B"
    end
  end

end
