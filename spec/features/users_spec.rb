require 'rails_helper'

describe "A user navigating the site" do
  context "when logged in" do
    let(:user) { create(:user) }
    let!(:exercise) { create(:inline_method_exercise) }

    before :each do
      login_as(user)
    end

    it "can start an exercise" do
      visit "/exercises"
      click_on "A"
      click_on "Exercises"
      expect(page).to have_css(".icon-star-half")
      expect(page).to have_content("10 points")
      expect(page).to have_content("A")
      expect(page).to have_content("Inline Method")
    end
  end
end
