# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/elvfs/version'

Gem::Specification.new do |gem|
  gem.name          = "paperclip-elvfs"
  gem.version       = Paperclip::Elvfs::VERSION
  gem.authors       = ["OpenTeam"]
  gem.email         = ["developers@openteam.ru"]
  gem.description   = %q{Paperclip ElVFS adapter}
  gem.summary       = %q{Paperclip ElVFS adapter}
  gem.homepage      = "http://github.com/openteam/paperclip-elvfs"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"

  gem.add_dependency 'curb'
  gem.add_dependency 'paperclip'

  gem.add_development_dependency 'rake'
end
