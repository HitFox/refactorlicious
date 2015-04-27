FactoryGirl.define do
  factory :exercise do
    points 10
    association :exercise_category, strategy: :build
    code_to_refactor "def bla bla end"
    solution "def bla end"
    key_words "def end"
  end

  factory :invalid_exercise, parent: :exercise do
    solution nil
  end

end
