class User < ActiveRecord::Base
  devise :omniauthable, :rememberable, :trackable
  has_many :user_exercises
  has_many :exercises, through: :user_exercises
  validates_presence_of :first_name, :last_name, :email

  def self.from_omniauth(auth)
    user = User.find_or_initialize_by(email: auth.info.email)
    user.email = auth.info.email
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.profile_picture = auth.info.image
    user
  end

  def exercise_status_hash
    @exercise_status_hash ||= generate_exercise_status_hash
  end

  private
  def generate_exercise_status_hash
    result = Hash.new
    user_exercises.each do |exercise_status|
      result[exercise_status.exercise_id] = exercise_status.status
    end
    return result
  end
end
