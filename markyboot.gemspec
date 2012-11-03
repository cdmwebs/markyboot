# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markyboot/version'

Gem::Specification.new do |gem|
  gem.name          = "markyboot"
  gem.version       = Markyboot::VERSION
  gem.authors       = ["Chris Moore"]
  gem.email         = ["cdmwebs@gmail.com"]
  gem.description   = %q{A quick gem to open a Markdown document in the default browser with some style applied.}
  gem.summary       = %q{Got some Markdown with code blocks you want to preview? Well, this is the gem for you!}
  gem.homepage      = "https://github.com/cdmwebs/markyboot"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'thor'
  gem.add_dependency 'redcarpet'

  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "aruba"
end
