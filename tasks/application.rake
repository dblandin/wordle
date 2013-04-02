desc 'Start the application'
task :default do
  system 'bundle exec shotgun config.ru'
end
