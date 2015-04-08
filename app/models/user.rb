class User < ActiveRecord::Base
  devise :omniauthable, :rememberable, :trackable
  has_many :exercise_statuses
  has_many :exercises, through: :exercise_statuses

  PERMITTED_DOMAINS = ['@hitfoxgroup.com', '@applift.com', '@finleap.com', '@appiris.com', '@dataconomy.com', '@ad2games.com', '@datamonk.com', '@finleap.com', '@finreach.com', '@savedo.com', '@billfront.com', '@pubnative.com', '@zeotap.com']

  def has_permitted_domain?
    PERMITTED_DOMAINS.include?(self.email.match(/@.*/).to_s)
  end

  def self.from_omniauth(auth)
    user = User.find_or_initialize_by(email: auth.info.email)
    user.email = auth.info.email
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.profile_picture = auth.info.image
    user
  end
end
