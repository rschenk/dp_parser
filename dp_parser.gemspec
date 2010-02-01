# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dp_parser}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Schenk"]
  s.date = %q{2010-02-01}
  s.description = %q{There are 12 different variants in Medline's Date Published field, none of which are particularly machine readable. Even worse, many are not exact dates, but date ranges. This is a treetop grammar to make dealing with them easier. }
  s.email = %q{rschenk@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "dp_parser.gemspec",
     "lib/date_published.rb",
     "lib/date_published.treetop",
     "spec/date_published_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/rschenk/dp_parser}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Parses the Date Published field in Medline into a machine readable format.}
  s.test_files = [
    "spec/date_published_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<treetop>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<treetop>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<treetop>, [">= 0"])
  end
end
