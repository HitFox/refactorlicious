require 'rails_helper'

describe CallbacksController do
  describe "#google_oauth2" do
    context "With valid user data" do
      it "authenticates user and redirects to exercises path" do
        stub_user_info_auth
        get :google_oauth2
        expect(response).to redirect_to(exercises_path)
      end
    end
  end
end
