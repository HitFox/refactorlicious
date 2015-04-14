namespace :user do
  desc "Connect the user with exercises from the seed data"
  task add_exercises: :environment do
    fail("Please run 'rake db:seed' before continuing.") if Exercise.count < 6
    fail("Please sign in with Google before continuing.") if User.count == 0

    user = User.last
    user.exercise_statuses.create(exercise_id: 2, finished: true)
    user.exercise_statuses.create(exercise_id: 3, finished: true)
    user.exercise_statuses.create(exercise_id: 5, finished: true)
    user.exercise_statuses.create(exercise_id: 1)
    user.save
  end
end
