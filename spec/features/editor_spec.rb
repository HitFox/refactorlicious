require 'feature_helper'

describe "The exercise editor" do
  let!(:exercise) { create(:exercise) }

  before do
    login_as(create(:user))
    visit "/exercises/#{exercise.to_param}"
  end

  it "loads the current code to refactor", js: true do
    expect(get_editor_value).to include "def bla bla; end"
  end

  it "stores not evaluated code in local storage", js: true do
    set_editor_value("I am typing")
    click_on "Exercises"
    click_on "A"
    expect(get_editor_value).to eq "I am typing"
  end

  it "shows a fail message if the user typed a wrong answer", js: true do
    set_editor_value("wrong")
    click_on "Submit"
    expect(page).to have_content('review your code, your refactoring is not correct')
  end

  it "show a syntax error message if the user submited an anwer with an invalid syntax", js: true do
    set_editor_value("defs wrong end")
    click_on "Submit"
    expect(page).to have_content('There are syntax errors in your answer')
  end

  it "shows a success message and marks the exercise as finished for a valid answer", js: true do
    set_editor_value(exercise.solution)
    click_on "Submit"
    expect(page).to have_content "Nice refactoring!"
    click_on "Exercises"
    expect(page).to have_css(".icon-star-two")
  end

end
