class SubmitResult
  attr_reader :syntax_errors
  attr_reader :type

  def initialize answer, keywords_hash
    if !answer.has_valid_syntax
      @syntax_errors = answer.syntax_errors
      @type = SubmitResultType["has_syntax_errors"]
    elsif SubmitResult.contains_key_words(answer, keywords_hash)
      @type = SubmitResultType["successfull"]
    else
      @type = SubmitResultType["pending_refactoring"]
    end
  end

  def is_successfull
    @type.eql? SubmitResultType["successfull"]
  end

  private

  def determine_submit_result answer, keywords_hash

  end

  class << self

    def contains_key_words answer, keywords_hash
      keywords_hash.each do |word, times|
        if (answer.scan(word).count != times)
          return false
        end
      end
      return true
    end
  end
end
