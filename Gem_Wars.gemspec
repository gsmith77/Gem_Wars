
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Gem_Wars/version"

Gem::Specification.new do |spec|
  spec.name          = "Gem_Wars"
  spec.version       = GemWars::VERSION
  spec.authors       = ["'grant smith'"]
  spec.email         = ["'grantsmith1256@gmail.com'"]

  spec.summary       = %q{"To list Star War Characters"}
  spec.homepage      = "https://github.com/gsmith77/Gem_Wars"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["Gem_Wars"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'gem-release'
  spec.add_development_dependency 'pry'
end
