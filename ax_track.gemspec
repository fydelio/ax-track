# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/ax_track/version"

Gem::Specification.new do |spec|
  spec.name          = "ax-track-ruby-client"
  spec.version       = AxTrack::VERSION
  spec.authors       = ["Philipp Baumann"]
  spec.email         = ["philipp@timly.ch"]

  spec.summary       = "API Wrapper for AX Track (from Adnexo)."
  spec.description   = "Official library for the AX Track application."
  spec.homepage      = "https://ax-track.ch/"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/adnexo-GmbH/ax-track-ruby-client"
  spec.metadata["changelog_uri"]   = "https://github.com/adnexo-GmbH/ax-track-ruby-client/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_dependency "faraday", "~> 1.7"
  spec.add_dependency "faraday_middleware", "~> 1.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
