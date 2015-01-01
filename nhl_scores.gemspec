# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: nhl_scores 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nhl_scores"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Travis Loncar"]
  s.date = "2015-01-01"
  s.description = "Use Ruby to grab live/recent NHL scores and upcoming matchup details. This gem ships with a minimal CLI."
  s.email = "loncar.travis@gmail.com"
  s.executables = ["nhl"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/nhl",
    "example.png",
    "lib/nhl_scores.rb",
    "lib/nhl_scores/cli.rb",
    "lib/nhl_scores/game.rb",
    "lib/nhl_scores/games.rb",
    "spec/nhl_scores_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/tbloncar/nhl_scores"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Use Ruby to grab live/recent NHL scores and upcoming matchup details."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["~> 0.13"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.19"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
    else
      s.add_dependency(%q<httparty>, ["~> 0.13"])
      s.add_dependency(%q<thor>, ["~> 0.19"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<httparty>, ["~> 0.13"])
    s.add_dependency(%q<thor>, ["~> 0.19"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
  end
end

