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

    it "can submit a new exercise if introducing valid data" do
      visit "/exercises/new"
      fill_in "Solution", with: "Buck dich"
      click_on "Submit"
      expect(page).to have_content("1 error prohibited this exercise from being saved")
      fill_in "Code to refactor", with: "Ramstein is awesome"
      click_on "Submit"
      expect(page).to have_content("You have successfully submitted a new exercise")
    end
  end

  context "when not logged in" do
    let(:user) { create(:user) }
    it "can sign up" do
      visit "/users/sign_up"
      fill_in "Email", with: "ramstein@ramstein.com"
      fill_in "Password", with: "12345678"
      fill_in "Password confirmation", with: "12345678"
      fill_in "First name", with: "Buck"
      fill_in "Last name", with: "Dich"
      within(".actions") do
        click_on "Sign up"
      end
      expect(page).to have_content("You have signed up successfully")
    end

    it "can log in" do
      visit "/users/sign_in"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      within(".actions") do
        click_on "Log in"
      end
      expect(page).to have_content("Signed in successfully")
    end
  end
end
