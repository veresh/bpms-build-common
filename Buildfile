# Keep this structure to allow the build system to update version numbers.


VERSION_NUMBER = "6.5.0.006"
 
ENV['JAVA_OPTS'] ||= '-Dfile.encoding=UTF-8'


desc "CommonDependencies"
define "dependencies" do
  file = ("dependencies.rb") 
  dependencies = artifact('org.intalio.common:dependencies:rb:'+VERSION_NUMBER).from(file)
  install dependencies
end
