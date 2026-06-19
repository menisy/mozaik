# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mozaik/service/version'

Gem::Specification.new do |spec|
  spec.name          = 'mozaik'
  spec.version       = Mozaik::Service::VERSION
  spec.authors       = ['Mohamed Elmenisy']

  spec.summary       = 'Service layer abstraction'
  spec.license       = 'MIT'
  spec.homepage      = 'https://github.com/menisy/mozaik'

  spec.required_ruby_version = '>= 3.0'

  spec.metadata = {
    'source_code_uri'       => spec.homepage,
    'bug_tracker_uri'       => "#{spec.homepage}/issues",
    'rubygems_mfa_required' => 'true'
  }

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'dry-struct', '>= 1.0', '< 2.0'
  spec.add_runtime_dependency 'dry-types', '>= 1.0', '< 2.0'
  spec.add_runtime_dependency 'i18n'

  spec.add_development_dependency 'bundler', '~> 2.0'
end
