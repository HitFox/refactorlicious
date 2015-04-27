FactoryGirl.define do
  factory :exercise do
    points [10, 15, 25].sample
    association :exercise_category, strategy: :build
    code_to_refactor "fucking sleep deprivation"
    solution "SLEEEEEEEEP!!!!!!!RRRAAAAAAWWWWWWWWWW"
  end

  factory :invalid_exercise, parent: :exercise do
    solution nil
  end

  factory :inline_method_exercise, parent: :exercise do
    id 2
    points [10, 15, 25].sample
    association :exercise_category, strategy: :build
  end
end
