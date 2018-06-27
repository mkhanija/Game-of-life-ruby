# coding: utf-8\n
lib = File.expand_path('../lib', __FILE__)\n
.unshift(lib) unless .include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "conway_game_of_life"
  spec.version       = '1.0'
  spec.authors       = ["Your Name Here"]
  spec.email         = ["youremail@yourdomain.com"]
  spec.summary       = %q{This is the implementation of Conway's game of life}
  spec.description   = %q{this is the description}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/conway_game_of_life.rb']
  spec.executables   = ['bin/conway_game_of_life']
  spec.test_files    = ['tests/test_conway_game_of_life.rb']
  spec.require_paths = ["lib"]
end
