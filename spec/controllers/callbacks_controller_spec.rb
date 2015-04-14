require 'rails_helper'

describe CallbacksController do

  let(:auth) {
    OpenStruct.new(info: OpenStruct.new({ first_name: "Walter", 
                                           last_name: "White",
                                               email: "walter.white@methfoxgroup.com",
                                     profile_picture: "http://example.com/picture.jpg" })
    )
  }

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = auth
  end

  describe "#google_oauth2" do
    context "With valid user data" do
      it "authenticates user and redirects to exercises path" do
        get :google_oauth2
        expect(response).to redirect_to(exercises_path)
      end
    end
  end
end
