# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bugherd_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'bugherd_client'
  spec.version       = BugherdClient::VERSION::STRING
  spec.authors       = ['John Faucett']
  spec.email         = ['jwaterfaucett@gmail.com']
  spec.summary       = %q{Ruby Client for the Bugherd API}
  spec.description   = %q{Ruby Client for the Bugherd Rest API}
  spec.homepage      = 'http://jwaterfaucett.github.io/bugherd_client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").select { |p| !(/examples/ =~ p) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '>= 1.7'
  spec.add_dependency 'hashie', '~> 3.0'
  spec.add_dependency 'activesupport', '> 3.0', '< 5.0'

  spec.add_development_dependency 'bundler', '>= 1.5'
  spec.add_development_dependency 'rspec', '>= 3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'webmock', '~> 1.20'
  spec.add_development_dependency 'vcr', '~> 2.9'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'simplecov', '0.9.1'
end
