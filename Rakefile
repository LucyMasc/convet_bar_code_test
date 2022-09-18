require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc 'Look for style guide ofenses in your code'

task :rubocop do
  sh 'rubocop --format simple || true'
end

task default: %i[rubocop spec]
