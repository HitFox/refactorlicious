module Admin
  class AdminControllerBase < ApplicationController
    before_action :authenticate_user!
    before_action :redirect_unless_admin

    # layout "admin"

    private

    def redirect_unless_admin
      unless current_user.admin?
        redirect_to exercises_path 
      end
    end
  end
end
