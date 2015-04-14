require "rails_helper"

describe 'exercises/show.html.haml' do

  context "On exercises show" do

    let(:exercise_category) { create(:exercise_category, name: "One purpose", description: "It's all about nothing", example: "def poop\n  puts 'poopypooooop'\nend")}
    let(:exercise) { create(:exercise, code_to_refactor: "def yo\n  puts 'Yo'\nend", solution: "This app sucks", exercise_category_id: exercise_category.id)}

    before :each do
      assign(:exercise, exercise)
      render
    end

    it "shows the code to refactor" do
      expect(rendered).to have_content "def yo"
    end

    it "shows the solution" do
      expect(rendered).to have_content "This app sucks"
    end

    it "shows the introduction" do
      expect(rendered).to have_content "One purpose"
      expect(rendered).to have_content "It's all about nothing"
    end

    it "shows the example" do
      expect(rendered).to have_content "def poop"
    end
  end

end
