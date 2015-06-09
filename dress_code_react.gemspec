# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.add_dependency 'redcarpet'
  s.add_dependency 'pygments.rb'
  s.add_dependency 'mustache'
  s.add_dependency 'colored'
  s.add_development_dependency 'rspec'

  s.name        = "dress_code_react"
  s.version     = "1.1.0"
  s.authors     = ["Ryan Florence", "Cameron Matheson", "Philip Kocanda"]
  s.homepage    = "http://github.com/philipkocanda/dress_code_react"
  s.summary     = "CSS Documentation and Styleguide Generator with React Support"
  s.description = "Dress Code React extracts comment blocks from your stylesheets and creates a styleguide using your CSS."

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.executables  = ['dress_code_react']
  s.require_path = 'lib'
end

