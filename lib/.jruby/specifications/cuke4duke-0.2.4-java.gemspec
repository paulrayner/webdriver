# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cuke4duke}
  s.version = "0.2.4"
  s.platform = %q{java}

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aslak Helles\303\270y"]
  s.date = %q{2010-03-01}
  s.default_executable = %q{cuke4duke}
  s.description = %q{Write Cucumber Step Definitions in Java, Scala, Groovy, Rhino Javascript, Clojure or Ioke}
  s.email = %q{cukes@googlegroups.com}
  s.executables = ["cuke4duke"]
  s.files = ["VERSION", "bin/cuke4duke", "lib/cuke4duke.jar"]
  s.homepage = %q{http://cukes.info}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{JVM support for Cucumber}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>, [">= 0.6.3"])
    else
      s.add_dependency(%q<cucumber>, [">= 0.6.3"])
    end
  else
    s.add_dependency(%q<cucumber>, [">= 0.6.3"])
  end
end
