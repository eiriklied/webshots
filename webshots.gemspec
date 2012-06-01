# -*- encoding: utf-8 -*-
require File.expand_path('../lib/webshots/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eirik Lied"]
  gem.email         = ["eiriklied@gmail.com"]
  gem.description   = %q{A container for wkhtml2png for mac and heroku}
  gem.summary       = %q{A container for wkhtml2png for mac and heroku}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "webshots"
  gem.require_paths = ["lib"]
  gem.version       = Webshots::VERSION
end
