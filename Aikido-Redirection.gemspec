
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aikido_redirection/version"

Gem::Specification.new do |spec|
  spec.name          = "Aikido-Redirection"
  spec.version       = Aikido::Redirection::VERSION
  spec.authors       = ["code860"]
  spec.email         = ["benjaminc.barber@gmail.com"]

  spec.summary       = %q{Redirection middleware standalone component of Aikido gem}
  spec.description   = %q{Using your attackers own energy and 'redirecting' back to them is a core technique in Aikido. This stand alone piece of the Aikido Gem will allow you to handle any type of request you mark on your site and redirect them to a site of your choosing.}
  spec.homepage      = "https://github.com/code860"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']
  spec.add_dependency 'rack'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
