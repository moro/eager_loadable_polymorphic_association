# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eager_loadable_polymorphic_association/version'

Gem::Specification.new do |gem|
  gem.name          = "eager_loadable_polymorphic_association"
  gem.version       = EagerLoadablePolymorphicAssociation::VERSION
  gem.authors       = ["moro"]
  gem.email         = ["moronatural@gmail.com"]
  gem.description   = %q{add eager loading functionality to ActiveRecord's polymorphic association.}
  gem.summary       = %q{add eager loading functionality to ActiveRecord's polymorphic association.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activerecord", [">= 3.0"]

  gem.add_development_dependency "rspec", [">= 2.0"]
  gem.add_development_dependency "rake"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "database_cleaner"
end
