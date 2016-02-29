# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lekanmastermind/version'

Gem::Specification.new do |spec|
  spec.name          = 'lekanmastermind'
  spec.version       = Lekanmastermind::VERSION
  spec.authors       = ['Olalekan Eyiowuawi']
  spec.email         = ['olalekan.eyiowuawi@andela.com']

  spec.summary       = 'The is an implementation of the mastermind game.'
  spec.description   = 'This is an implementation of the mastermind game with 3 difficulty levels'
  spec.homepage      = 'https://github.com/andela-oeyiowuawi/lekanmastermind'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['lekanmastermind']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'simplecov'
end
