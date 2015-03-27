# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'shadow_form'

Gem::Specification.new do |spec|
  spec.name          = 'shadow_form'
  spec.version       = ShadowForm::VERSION
  spec.authors       = ['Pawel Niemczyk']
  spec.email         = ['pniemczyk.info@.gmail.com']
  spec.summary       = %q{This is simple wrapper on the model to prepare forms for all validation usage cases}
  spec.description   = %q{This is simple wrapper on the model to prepare forms for all validation usage cases}
  spec.homepage      = 'https://github.com/pniemczyk/shadow_form'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard', '~> 2.12'
  spec.add_development_dependency 'guard-rspec', '~> 4.5'
  spec.add_development_dependency 'guard-rubocop', '~> 1.2'
  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'activemodel', '~> 4.2'
  spec.add_development_dependency 'awesome_print', '~> 1.6'
end
