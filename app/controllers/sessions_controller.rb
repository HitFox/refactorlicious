class SessionsController < ApplicationController
  def error
  end

  def destroy
    sign_out @user
    flash[:notice] = "Logged out successfully!"
    redirect_to root_path
  end
end
