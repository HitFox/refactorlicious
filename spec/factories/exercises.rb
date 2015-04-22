FactoryGirl.define do
  factory :exercise do
    points [10, 15, 25].sample
    association :exercise_category, strategy: :build
  end

  factory :inline_method_exercise, parent: :exercise do
    id 2
    points [10, 15, 25].sample
    association :exercise_category, strategy: :build
  end
end
