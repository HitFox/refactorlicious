require 'feature_helper'

describe "The exercise editor" do
  let!(:exercise) { create(:exercise) }

  before do
    login_as(create(:user))
    visit "/exercises/#{exercise.to_param}"
  end

  it "loads the current code to refactor", js: true do
    expect(get_editor_value).to include "def bla bla end"
  end

  it "stores not evaluated code in local storage", js: true do
    set_editor_value("I am typing")
    click_on "Exercises"
    click_on "A"
    expect(get_editor_value).to eq "I am typing"
  end

  it "shows a fail message if the user typed a wrong answer", js: true do
    set_editor_value("I am typing")
    click_on "Submit"
    expect(page).to have_content('review your code, something is wrong')
  end

  it "shows a success message and marks the exercise as finished for a valid answer", js: true do
    set_editor_value("def end")
    click_on "Submit"
    expect(page).to have_content "Nice refactoring!"
    click_on "Exercises"
    expect(page).to have_css(".icon-star-two")
  end

end
