require 'rails_helper'

describe User do

  let(:user) { build_stubbed(:user) }

  it { is_expected.to have_many :exercises }
  it { is_expected.to have_many :user_exercises }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }

  describe ".from_omniauth" do
    it "creates a new user from an auth hash" do
      auth = OpenStruct.new(info: OpenStruct.new({ first_name: "Walter",
                                                   last_name: "White",
                                                   email: "walter.white@methfoxgroup.com",
                                                   profile_picture: "http://example.com/picture.jpg" })
                            )

      User.from_omniauth(auth).save

      expect(User.last.first_name).to eq("Walter")
      expect(User.last.last_name).to eq("White")
    end
  end
end
