class User < ActiveRecord::Base
  devise :omniauthable, :rememberable, :trackable
  has_many :exercise_statuses
  has_many :exercises, through: :exercise_statuses
  validates_presence_of :first_name, :last_name, :email

  def self.from_omniauth(auth)
    user = User.find_or_initialize_by(email: auth.info.email)
    user.email = auth.info.email
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.profile_picture = auth.info.image
    user
  end
end
