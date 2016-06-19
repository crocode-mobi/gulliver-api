# # config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'gulliverapp'
set :repo_url, 'git@github.com:crocode-mobi/gulliver-api' # Edit this to match your repository
set :branch, :master
set :deploy_to, '/home/deploy/gulliverapp'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.2.3'

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# namespace :deploy do
#
#   desc 'Reload application'
#   task :reload do
#     desc "Reload app after change"
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end
#
#   %w[start stop restart].each do |command|
#     desc "#{command} Nginx."
#     task command do
#       on roles(:app) do
#         execute "sudo service nginx #{command}"
#       end
#     end
#   end
#
#   after :publishing, :reload
# end
#
# #These are one time tasks for the first deploy
# namespace :setup do
#
#   desc "Upload database.yml and application.yml files."
#   task :yml do
#     on roles(:app) do
#       execute "mkdir -p #{shared_path}/config"
#       #upload! StringIO.new(File.read("config/database.yml")), "#{shared_path}/config/database.yml"
#       upload! StringIO.new(File.read("config/application.yml")), "#{shared_path}/config/application.yml"
#     end
#   end
#
#   desc "Create the database."
#   task :db_create do
#     on roles(:app) do
#       within "#{release_path}" do
#         with rails_env: fetch(:rails_env) do
#           execute :rake, "db:create"
#         end
#       end
#     end
#   end
#
#   desc "Seed the database."
#   task :db_seed do
#     on roles(:app) do
#       within "#{release_path}" do
#         with rails_env: fetch(:rails_env) do
#           execute :rake, "db:seed"
#         end
#       end
#     end
#   end
#
#   if fetch(:initial) == "true"
#     before 'deploy:migrate', 'setup:db_create'
#     after 'deploy:migrate', 'setup:db_seed'
#   end
#
#   before 'deploy:starting', 'setup:yml'
#
# end


# namespace :deploy do
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
#
# end
