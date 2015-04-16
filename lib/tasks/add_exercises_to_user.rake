namespace :user do
  desc "Connect the user with exercises from the seed data"
  task add_exercises: :environment do
    fail("Please run 'rake db:seed' before continuing.") if Exercise.count < 6
    fail("Please sign in with Google before continuing.") if User.count == 0

    user = User.last
    user.user_exercises.create(exercise_id: 2, status: UserExercise.statuses[:finished])
    user.user_exercises.create(exercise_id: 3, status: UserExercise.statuses[:finished])
    user.user_exercises.create(exercise_id: 5, status: UserExercise.statuses[:finished])
    user.user_exercises.create(exercise_id: 1, status: UserExercise.statuses[:incomplete])
    user.save
  end
end
