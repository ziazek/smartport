# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'



require 'capistrano/rbenv'
# require 'capistrano/chruby'
require 'capistrano/bundler'
require 'capistrano/sidekiq'
require 'capistrano/sidekiq/monit'
# require 'capistrano/postgresql' # this is not from the book
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require "whenever/capistrano"
require 'capistrano/rails/collection'
# require 'capistrano/cookbook'
# require 'airbrake/capistrano3'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }

# (custom) Loads helper methods for the tasks
Dir.glob('lib/capistrano/**/*.rb').each { |r| import r }