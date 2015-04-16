require 'feature_helper'

describe "The exercise editor" do
  let!(:exercise) { create(:exercise, code_to_refactor: "some code here") }

  before do
    login_as(create(:user))
    visit "/exercises/#{exercise.to_param}"
  end

  it "loads the current code to refactor", js: true do
    expect(get_editor_value).to eq "some code here"
  end

  it "stores not evaluated code in local storage", js: true do
    set_editor_value("I am typing #{exercise.code_to_refactor}")
    click_on "Exercises"
    click_on "A"
    expect(get_editor_value).to eq "I am typing some code here"
  end
end
