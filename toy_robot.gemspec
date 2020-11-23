require_relative 'lib/toy_robot/version'

Gem::Specification.new do |spec|
  spec.name          = "toy_robot"
  spec.version       = ToyRobot::VERSION
  spec.authors       = ["trashyO"]
  spec.email         = ["trashy@me.com"]

  spec.summary       = %q{ToyRobot implemented using Ruby and command pattern}
  spec.description   = %q{Create a world where a ToyRobot can navigate via commands: PLACE X,Y,DIRECTION,MOVE,LEFT,RIGHT and REPORT.}
  spec.homepage      = "https://rubygems.org/gems/example"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Nesting-Canary/toy-robot-command-pattern"
  spec.metadata["changelog_uri"] = "https://github.com/Nesting-Canary/toy-robot-command-pattern/blob/master/lib/toy_robot/version.rb"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec", "~> 3.2"
end
