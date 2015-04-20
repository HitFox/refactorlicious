FactoryGirl.define do
  factory :exercise_category do
    name "Introduce Explaining Variable"
    description "Sometimes you come across a method in which the body is as clear as the name. In this case it makes sense to get rid of the method\n\n1. Check that the method is not polymorphic.\n\n2. Find all calls to the method.\n\n3.Replace each call with the method body.\n"
    example "def get_rating\n  more_than_five_late_deliveries ? 2 : 1\nend\n\ndef more_than_five_late_deliveries\n  @number_of_late_deliveries > 5\nend\n\n# ||\n# \\/\n\ndef get_rating\n  @number_of_late_deliveries > 5 ? 2 : 1\nend\n"
  end
end
