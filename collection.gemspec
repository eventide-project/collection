# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'collection'
  s.summary = 'Strictly-typed set'
  s.version = '0.1.2.0'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/collection'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_development_dependency 'test_bench'
  s.add_development_dependency 'telemetry-logger'
end
