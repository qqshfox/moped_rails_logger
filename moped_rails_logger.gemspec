# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moped_rails_logger/version'

Gem::Specification.new do |gem|
  gem.name          = "moped_rails_logger"
  gem.version       = MopedRailsLogger::VERSION
  gem.authors       = ["Hanfei Shen"]
  gem.email         = ["qqshfox@gmail.com"]
  gem.description   = %q{Rails-like logger for moped}
  gem.summary       = %q{Rails-like logger for moped}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "moped"
  gem.add_runtime_dependency "activesupport"
end
