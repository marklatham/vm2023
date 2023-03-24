# config valid for current version and patch releases of Capistrano
lock "~> 3.17.2"

set :application, "voter-media"
set :repo_url, "git@github.com:marklatham/vm2023.git"

# Default branch is :master
ask :branch, :main

# Default deploy_to directory is home
set :deploy_to, "/home/deploy/#{fetch :application}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :deploy do
  desc 'Install node modules'
  task :install_node_modules do
    on roles(:app) do
      within release_path do
        execute :yarn, 'install --production --silent'
      end
    end
  end
end

# Run install_node_modules task before assets:precompile
before 'bundler:install', 'deploy:install_node_modules'
