# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "nhl_scores"
  gem.homepage = "http://github.com/tbloncar/nhl_scores"
  gem.license = "MIT"
  gem.summary = "Use Ruby to grab live/recent NHL scores and upcoming matchup details."
  gem.description = "Use Ruby to grab live/recent NHL scores and upcoming matchup details. This gem ships with a minimal CLI."
  gem.email = "loncar.travis@gmail.com"
  gem.authors = ["Travis Loncar"]
  # dependencies defined in Gemfile
  gem.add_dependency 'httparty'
  gem.add_dependency 'thor'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "nhl_scores #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
