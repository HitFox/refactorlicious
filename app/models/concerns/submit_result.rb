class SubmitResult
  attr_reader :syntax_errors
  attr_reader :type

  def initialize answer, keywords_hash
    @syntax_errors = SubmitResult.find_syntax_errors(answer)
    @type = determine_submit_result(answer, keywords_hash)
  end

  def is_successfull
    @type.eql? SubmitResultType["successfull"]
  end

  private

  def determine_submit_result answer, keywords_hash
    if @syntax_errors
      SubmitResultType["has_syntax_errors"]
    elsif SubmitResult.contains_key_words(answer, keywords_hash)
      SubmitResultType["successfull"]
    else
      SubmitResultType["pending_refactoring"]
    end
  end

  class << self
    def find_syntax_errors script
      catch(:x) do
        eval("throw :x
          "+ script )
      end
    rescue SyntaxError => e
      str = e.message.gsub(/\(eval\):\d+/) do |match|
        match.gsub(/\d+/) do |match|
          match.to_i - 1
        end
      end
      str.gsub(/\(eval\)/, 'answer')
    end

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
