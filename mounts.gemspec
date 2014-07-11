# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mounts/version'

Gem::Specification.new do |spec|
  spec.name          = "mounts"
  spec.version       = Mounts::VERSION
  spec.authors       = ["Robert Greenshields"]
  spec.email         = ["bob@thegreenshields.com"]
  spec.summary       = %q{Ruby module to manage linux mounts}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end