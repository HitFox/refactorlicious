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
      expect(page).to have_css(".icon-star")
      expect(page).to have_content("10 points")
      expect(page).to have_content("A")
      expect(page).to have_content("Inline Method")
      click_on "A"
      click_on "Exercises"
      expect(page).to have_css(".icon-star-half")
    end

    it "can submit a new exercise" do
      visit "/exercises/new"
      fill_in "Code to refactor", with: "Ramstein is awesome"
      fill_in "Solution", with: "Buck dich"
      click_on "Submit"
      expect(page).to have_content("You have successfully submitted a new exercise")
    end
  end
end
