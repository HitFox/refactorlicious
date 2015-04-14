module FeatureMacros
  def login_as(user = create(:user))
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        info: {
          email: user.email,
          first_name: user.first_name,
          last_name: user.last_name,
          profile_picture: user.profile_picture
        }
      }
    )
    visit user_omniauth_authorize_path(provider: "google_oauth2")
  end
end
