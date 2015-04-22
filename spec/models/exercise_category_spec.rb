require 'rails_helper'

describe ExerciseCategory do

  before do
    create(:exercise)
  end

  context "being destroyed" do
    it "destroys associated exercises" do
      ExerciseCategory.first.destroy

      expect(Exercise.count).to be_zero
    end
  end
end
