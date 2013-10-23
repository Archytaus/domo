require 'rake'

desc 'Runs all tests'
task default: [ :test ]

task :test do
  require './tests/test_helper.rb'
  Dir.glob('./tests/**/*_test.rb').each { |file| require file}
end