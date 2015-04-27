require 'rails_helper'

describe "A user navigating the site" do
  context "when logged in" do
    let(:user) { create(:user) }
    let!(:exercise) { create(:exercise) }

    before :each do
      login_as(user)
    end

    it "can start an exercise" do
      visit "/exercises"
      allow_any_instance_of(Exercise).to receive(:id) { 2 } # Works for now, depending on _inline_method_2.html.erb
      click_on "A"
      click_on "Exercises"
      expect(page).to have_css(".icon-star-half")
      expect(page).to have_content("10 points")
      expect(page).to have_content("A")
      expect(page).to have_content("Inline Method")
    end
  end
end
