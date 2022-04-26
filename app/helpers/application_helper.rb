module ApplicationHelper
  def svg_tag(source, **options)
    svg = raw File.read("app/assets/#{source}")
    content_tag(:svg, svg, options)
  end
end
