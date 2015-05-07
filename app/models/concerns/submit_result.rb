class SubmitResult
  module SubmitResultType
    SUCCESSFULL = "successfull"
    HAS_SYNTAX_ERRORS = "has_syntax_errors"
    PENDING_REFACTORING = "pending_refactoring"
  end

  attr_reader :syntax_errors
  attr_reader :type

  def initialize answer, keywords_hash
    @syntax_errors = SubmitResult.findSyntaxErrors(answer)
    @type = determineSubmitResult(answer, keywords_hash)
  end

  def is_successfull()
    @type == SubmitResultType::SUCCESSFULL
  end

  private

  def determineSubmitResult answer, keywords_hash
    if (@syntax_errors)
      SubmitResultType::HAS_SYNTAX_ERRORS
    elsif SubmitResult.containsKeyWords(answer, keywords_hash)
      SubmitResultType::SUCCESSFULL
    else
      SubmitResultType::PENDING_REFACTORING
    end
  end

  class << self
    def findSyntaxErrors script
      catch(:x) do
        eval("throw :x
          "+ script )
      end
    rescue Exception => e
      str = e.message.gsub(/\(eval\):\d+/) do |match|
        match.gsub(/\d+/) do |match|
          match.to_i - 1
        end
      end
      str.gsub(/\(eval\)/, 'answer')
    end

    def containsKeyWords answer, keywords_hash
      keywords_hash.each do |word, times|
        if (answer.scan(word).count != times)
          return false
        end
      end
      return true
    end
  end
end
