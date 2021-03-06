require 'rails_helper'

describe ExerciseDecorator do

  describe "#difficulty_level" do
    let(:easy_exercise) { ExerciseDecorator.new(build_stubbed(:exercise, points: 10)) }
    let(:medium_exercise) { ExerciseDecorator.new(build_stubbed(:exercise, points: 15)) }
    let(:difficult_exercise) { ExerciseDecorator.new(build_stubbed(:exercise, points: 25)) }

    it "returns 'easy' for a easy exercise" do
      expect(easy_exercise.difficulty_level).to eq "easy"
    end

    it "returns 'medium' for a medium exercise" do
      expect(medium_exercise.difficulty_level).to eq "medium"
    end

    it "returns 'difficult' for a difficult exercise" do
      expect(difficult_exercise.difficulty_level).to eq "difficult"
    end
  end

  describe "#icon_class" do
    let(:exercise) { ExerciseDecorator.new(build_stubbed(:exercise)) }

    context "Exercise not started" do
      it "returns the right class" do
        allow(exercise).to receive(:user_progress) { "not-started" }
        expect(exercise.icon_class).to eq "icon-star"
      end
    end

    context "Exercise started" do
      it "returns the right class" do
        allow(exercise).to receive(:user_progress) { "incomplete" }
        expect(exercise.icon_class).to eq "icon-star-half"
      end
    end

    context "Exercise finished" do
      it "returns the right class" do
        allow(exercise).to receive(:user_progress) { "finished" }
        expect(exercise.icon_class).to eq "icon-star-two"
      end
    end
  end
end
