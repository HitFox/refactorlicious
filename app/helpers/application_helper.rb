module ApplicationHelper

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

  def svg_icon(icon_class, icon_path)
    raw "<svg class=\"#{icon_class}\"><use xlink:href=#{icon_path}></use></svg>"
  end
end
