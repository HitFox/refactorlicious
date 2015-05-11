class User < ActiveRecord::Base
   devise :database_authenticatable, :omniauthable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauth_providers => [:google_oauth2]

  has_many :user_exercises
  has_many :exercises, through: :user_exercises
  validates_presence_of :first_name, :last_name, :email

  def self.from_omniauth(auth)
    user = User.find_or_initialize_by(email: auth.info.email)
    user.email = auth.info.email
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.profile_picture = auth.info.image
    user.password = Devise.friendly_token[0,20]
    user
  end

  def user_exercises_hash
    @user_exercises_hash ||= Hash[user_exercises.map { |a| [a.exercise_id, a.status]}]
  end

  def admin?
    role == "admin"
  end
end
