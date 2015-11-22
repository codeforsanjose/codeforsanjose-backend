require 'rubocop/rake_task'

begin
  RuboCop::RakeTask.new
rescue LoadError
end
