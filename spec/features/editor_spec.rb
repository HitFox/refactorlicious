require 'feature_helper'

describe "The exercise editor" do
  let!(:exercise) { create(:exercise) }

  before do
    login_as(create(:user))
    visit "/exercises/#{exercise.to_param}"
  end

  it "loads the current code to refactor", js: true do
    expect(get_editor_value).to include "def price"
  end

  it "stores not evaluated code in local storage", js: true do
    set_editor_value("I typed some code here")
    click_on "Exercises"
    click_on "A"
    expect(get_editor_value).to include "I typed some code here"
  end
end
