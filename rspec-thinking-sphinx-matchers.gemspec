# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-thinking-sphinx-matchers/version'

Gem::Specification.new do |gem|
  gem.name          = "rspec-thinking-sphinx-matchers"
  gem.version       = RspecThinkingSphinxMatchers::VERSION
  gem.authors       = ["Govinda Fichtner"]
  gem.email         = ["govinda@beagile.de"]
  gem.description   = %q{Rspec matchers for thinking sphinx index definition}
  gem.summary       = %q{Rspec matchers for thinking sphinx index definition}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency 'combustion', "~> 0.4.0"
  gem.add_development_dependency "mysql2"
  gem.add_runtime_dependency "rspec"
  gem.add_runtime_dependency "thinking-sphinx", "~>3.0"
end
