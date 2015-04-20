FactoryGirl.define do
  factory :exercise do
    points [10, 15, 25].sample
    association :exercise_category, strategy: :build
  end
end
