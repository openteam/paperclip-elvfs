# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/elvfs/version'

Gem::Specification.new do |gem|
  gem.name          = "paperclip-elvfs"
  gem.version       = Paperclip::Elvfs::VERSION
  gem.authors       = ["Dmitry Lihachev"]
  gem.email         = ["lda@openteam.ru"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"
  gem.add_dependency 'curb'
  gem.add_dependency 'paperclip'
end
