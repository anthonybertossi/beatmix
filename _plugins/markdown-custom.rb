require 'jekyll'
require 'kramdown'
require 'github/markdown'  

class Jekyll::Converters::Markdown::KramdownCustom
  def initialize(config)
    @site_config = config
  end

  def convert(content)
    # (this _must_ return the resulting String after the rendering)
    result = Kramdown::Document.new(content).to_html
    result = result.gsub(/\[ \]/, '<input type="checkbox" onclick="event.stopPropagation(); event.preventDefault();" style="outline: none;">')
    result = result.gsub(/\[(x|X|\.)\]/, '<input type="checkbox" checked onclick="event.stopPropagation(); event.preventDefault();" style="outline: none;">')
    result = result.gsub(/\( \)/, '<input type="radio" onclick="event.stopPropagation(); event.preventDefault();" style="outline: none;">')
    result = result.gsub(/\((x|X|\.)\)/, '<input type="radio" checked onclick="event.stopPropagation(); event.preventDefault();" style="outline: none;">')
  end
end
