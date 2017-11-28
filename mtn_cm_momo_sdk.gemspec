# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mtn_cm_momo_sdk/version"

Gem::Specification.new do |spec|
  spec.name          = "mtn_cm_momo_sdk"
  spec.version       = MtnCmMomoSdk::VERSION
  spec.authors       = ["Fomekong Tekatsop Evaris"]
  spec.email         = ["evarisfomekong@gmail.com"]

  spec.summary = %q{MTN Cameroon Mobile Mobile Sdk , allowing you do ,BUY NOW ,REFUND,DONATE,CHECK OUT.}
  spec.description = %q{MTN Cameroon Mobile Mobile Sdk , allowing you do ,BUY NOW ,REFUND,DONATE,CHECK OUT requests. https://developer.mtn.cm/.}
  spec.homepage = "https://github.com/Foris-master/mtn_cm_momo_sdk"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
=begin
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
=end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rails", "~> 4.0"
  spec.add_dependency "httparty", "~>0.10"
  spec.add_dependency "rails", "~> 4.0"
end
