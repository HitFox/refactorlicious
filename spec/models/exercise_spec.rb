require "rails_helper"

describe Exercise do
  let(:exercise) { build_stubbed(:exercise) }

  it { is_expected.to validate_presence_of :points }
  it { is_expected.to validate_presence_of :solution }
  it { is_expected.to validate_presence_of :code_to_refactor }
  it { is_expected.to belong_to :exercise_category }
end
