module ControllerMacros
  def stub_user_info_auth(user = create(:user))
    auth = OpenStruct.new(info: OpenStruct.new({ first_name: user.first_name, 
                                                  last_name: user.last_name,
                                                      email: "#{user.first_name}.#{user.last_name}@hitfoxgroup.com".downcase,
                                            profile_picture: "http://example.com/picture.jpg" })
            )
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = auth
  end

  def login_user(user = create(:user))
    stub_user_info_auth(user)
    sign_in user
  end
end
