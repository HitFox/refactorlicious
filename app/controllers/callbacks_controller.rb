class CallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.save
      flash[:notice] = "Signed in successfully!"
      sign_in_and_redirect user
    else
      flash[:alert] = "Sorry, but we could not log you in via Google!"
      redirect_to error_session_path
    end
  end
end