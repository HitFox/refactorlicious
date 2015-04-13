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

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    renderer ||= CodeRayify.new(filter_html: true, hard_wrap: true)
    options = { strikethrough: true, fenced_code_blocks: true, no_intra_emphasis: true }
    md ||= Redcarpet::Markdown.new(renderer, options)
    md.render(text).html_safe
  end
end
