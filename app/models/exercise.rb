class Exercise < ActiveRecord::Base
  has_many :user_exercises
  has_many :users, through: :user_exercises
  belongs_to :exercise_category
  validates_presence_of :solution, :code_to_refactor, :points

  enum status: { drafted: 0 , approved: 1, rejected: 2 }

  delegate :name, :description, :example, to: :exercise_category, allow_nil: true, prefix: true

  def keywords_hash
    if (key_words)
      words = key_words.split(',')
      words.inject(Hash.new(0)) { |h, w| h[w.strip]+=1 ; h}
    else
      words = { "def" => solution.scan("def").count}
    end
  end
end
