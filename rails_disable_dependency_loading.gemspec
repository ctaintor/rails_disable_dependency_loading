# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_disable_dependency_loading/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_disable_dependency_loading"
  spec.version       = RailsDisableDependencyLoading::VERSION
  spec.authors       = ["Case Taintor"]
  spec.email         = ["casetaintor@gmail.com"]
  spec.summary       = %q{Adds a rails initializer to make it easier to catch thread-safety issues in your code.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "rails", "~> 4.0"
end
