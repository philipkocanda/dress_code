require_relative '../dress_code_react'
require_relative 'renderer'

class DressCodeReact::Document

  MD = Redcarpet::Markdown.new(DressCodeReact::Renderer.new, {
    fenced_code_blocks: true,
    strikethrough: true,
    superscript: true,
    tables: true
  })

  attr_accessor :path, :relative_path, :prose, :component

  def initialize(attributes)
    @attributes = attributes
    @path = @attributes[:path]
    @relative_path = @attributes[:relative_path]
    @prose = @attributes[:prose]
    @component = @attributes[:component]
  end

  def to_html
    MD.render(@prose)
  end

  def cjsx_code_blocks
    MD.renderer.cjsx_code_blocks
  end
end

