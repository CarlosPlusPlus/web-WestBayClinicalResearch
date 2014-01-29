require 'bundler/capistrano'
require_relative 'authentication'

set :application, 'wbcr'
set :repository,  'git@github.com:CarlosPlusPlus/web-WestBayClinicalResearch.git'

set :user, 'admin'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false
set :scm, :git

default_run_options[:pty] = true

role :web, ENV['ServerIP']
role :app, ENV['ServerIP']

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end