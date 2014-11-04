# config valid only for Capistrano 3.1
lock '3.1.0'


set :application, 'jeu'
set :repo_url, 'git@github.com:sylvainlb/jeu.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/opt/apps/jeusans'

set :ssh_options, {
    proxy: Net::SSH::Proxy::Command.new('ssh deployer@oenologs.fr -p 4321 -W %h:%p'),
    forward_agent: false
  }

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system script}

# Default value for default_env is {}
#set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }
set :rbenv_type, :user
set :rbenv_ruby, '1.9.3-p545'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails clockworkd daemon}

# Default value for keep_releases is 5
# set :keep_releases, 5


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Stop workers'
  task :stop_workers do
    #on roles(:app), in: :sequence, wait: 5 do
      invoke 'workers:clockwork:stop'
      invoke 'workers:delayed_job:stop'
   # end
  end

  desc 'Restart workers'
  task :restart_workers do
    #on roles(:app), in: :sequence, wait: 5 do
    invoke 'workers:clockwork:restart'
    invoke 'workers:delayed_job:restart'
    # end
  end

  after :started, :stop_workers
  after :restart, :restart_workers


  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
