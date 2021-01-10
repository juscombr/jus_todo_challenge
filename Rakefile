# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks


require 'rspec/core/rake_task'

task :tests => [:spec]

desc 'Task para execução dos specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/*_test.rb'
  t.verbose = false
end