require 'rails_helper'

describe "An admin managing exercises" do
  context "when logged in" do
    let(:admin) { create(:admin) }
    let!(:exercise) { create(:exercise) }

    before :each do
      login_as(admin)
    end

    it "can update an exercise" do
      visit "/admin/exercises"
      click_on "Exercise 1"
      save_and_open_page
      select('Inline Method', from: "Exercise category")
      select('10', from: 'Points')
      fill_in "Code to refactor", with: "Ramstein is awesome"
      fill_in "Solution", with: "Buck dich"
      select('rejected', from: "Status")
      click_on "Submit"
      expect(page).to have_content("Exercise was successfully updated")
    end

  end
end
