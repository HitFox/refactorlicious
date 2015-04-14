FactoryGirl.define do
  factory :exercise do
    points [10, 15, 25].sample
    code_to_refactor "def get_chocolate_eggs\n  older_than_10 ? 1 : 2\nend\n\ndef older_than_10\n  self.age > 10\nend\n"
    solution "def get_chocolate_eggs\n  self.age > 10 ? 1 : 2\nend\n"
    association :exercise_category, strategy: :build
  end
end
