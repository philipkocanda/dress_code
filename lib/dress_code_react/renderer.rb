require 'redcarpet'
require 'pygments'
require_relative '../dress_code_react'

class DressCodeReact::Renderer < Redcarpet::Render::HTML

  attr_reader :cjsx_code_blocks

  def initialize
    super
    @cjsx_code_blocks = []
  end

  def table(header, body)
    "<table class=\"table\">" \
      "#{header}#{body}" \
    "</table>"
  end

  def block_code(code, language)
    render_language = language
    render_language = 'html' if language == 'cjsx'

    syntax = Pygments.highlight(code, {
      lexer: render_language,
      options: { encoding: 'utf-8' }
    })

    inner = if language == 'html'
      "#{syntax} <div class='code-rendered'>#{code}</div>"
    elsif language == 'cjsx'
      index = @cjsx_code_blocks.length
      @cjsx_code_blocks << code

      "#{syntax}
      <div class='code-rendered'>
        <div class='cjsx-rendered-#{index}'>cjsx-rendered-#{index}</div>
      </div>"
    else
      syntax
    end

    "<div class='code-demo'>#{inner}</div>"
  end
end

