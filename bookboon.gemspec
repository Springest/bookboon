# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookboon/version'

Gem::Specification.new do |spec|
  spec.name          = "bookboon"
  spec.version       = Bookboon::VERSION
  spec.authors       = ["Dennis Paagman"]
  spec.email         = ["dennispaagman@gmail.com"]

  spec.summary       = %q{Ruby API wrapper for the Bookboon API}
  spec.homepage      = "https://github.com/springest/bookboon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", " ~> 0.13"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "webmock", "~> 2.1"
end
