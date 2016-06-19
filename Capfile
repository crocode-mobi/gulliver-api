# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/rails/migrations'
require 'capistrano/puma'
# require 'capistrano/rails/assets' # for asset handling add
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
