require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "dp_parser"
    gem.summary = %Q{Parses the Date Published field in Medline into a machine readable format.}
    gem.description = %Q{There are 12 different variants in Medline's Date Published field, none of which are particularly machine readable. Even worse, many are not exact dates, but date ranges. This is a treetop grammar to make dealing with them easier. }
    gem.email = "rschenk@gmail.com"
    gem.homepage = "http://github.com/rschenk/dp_parser"
    gem.authors = ["Ryan Schenk"]
    gem.add_development_dependency "rspec"
    gem.add_development_dependency "treetop"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "dp_parser #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
