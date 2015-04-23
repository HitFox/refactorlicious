class Exercise < ActiveRecord::Base
  has_many :user_exercises
  has_many :users, through: :user_exercises
  belongs_to :exercise_category

  def keywords_hash
    words = key_words.split(',')
    words.inject(Hash.new(0)) { |h, w| h[w.strip]+=1 ; h}
  end
end
