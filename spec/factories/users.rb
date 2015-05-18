FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email { "#{first_name}.#{last_name}@hitfoxgroup.com".downcase }
    password "password"
    password_confirmation "password"
    score Faker::Number.number(2)
    profile_picture "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg"
    role "user"
  end

  factory :admin, parent: :user do
    role "admin"
  end
end

