require "rails_helper"

describe 'exercises/show.html.haml' do

  context "On exercises show" do

    let(:exercise) { create(:exercise) }

    before :each do
      assign(:exercise, exercise)
      render
    end

    it "shows the code to refactor" do
      expect(rendered).to have_content "more_than_five_late_deliveries ? 2 : 1"
    end

    it "shows the solution" do
      expect(rendered).to have_content "@number_of_late_deliveries > 5 ? 2 : 1"
    end

    it "shows the introduction" do
      expect(rendered).to have_content "Inline Method"
      expect(rendered).to have_content "Sometimes you come across a method in which the body "
    end

    it "shows the example" do
      expect(rendered).to have_content "def more_than_five_late_deliveries"
    end
  end

end
