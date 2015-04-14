module ApplicationHelper
  def difficulty_level(exercise)
    if exercise.points >= 25
      "difficult"
    elsif exercise.points >= 15
      "medium"
    else
      "easy"
    end
  end

  def markdown(text)
    renderer ||= Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
    options = { strikethrough: true, fenced_code_blocks: true, no_intra_emphasis: true }
    md ||= Redcarpet::Markdown.new(renderer, options)
    md.render(text).html_safe
  end

  def highlight(code, language = :ruby)
    CodeRay.scan(code, language).html(
      :wrap => nil,
      :line_numbers => :inline,
      :css => :style
    ).html_safe
  end

  def prev_exercise
    prev_exercise = Exercise.find_by(id: @exercise.id - 1)
    if prev_exercise
      prev_exercise
    else
      @exercise
    end
  end

  def next_exercise
    next_exercise = Exercise.find_by(id: @exercise.id + 1)
    if next_exercise
      next_exercise
    else
      @exercise
    end
  end
end
