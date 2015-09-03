# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby/snmp/agent/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-snmp-agent"
  spec.version       = Ruby::Snmp::Agent::VERSION
  spec.authors       = ["mpalmer","mongrelx"]
  spec.email         = ["mongrelx@gmail.com"]

  spec.summary       = "Ruby snmp agent" 
  spec.homepage      = "https://github.com/mongrelx/ruby-snmp-agent"
  spec.license	     = "GPLv2"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib","plugin"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "snmp", "~> 10.0"
  spec.add_development_dependency "socket", "~> 10.0"
  spec.add_development_dependency "logger", "~> 10.0"
end
