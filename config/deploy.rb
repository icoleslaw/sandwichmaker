set :bundle_cmd, "/home/adingle/webapps/sandwich/bin/bundle"

# Automatically install bundled gems.
require "bundler/capistrano"

set :rake, "/home/adingle/webapps/sandwich/bin/bundle exec /home/adingle/webapps/sandwich/bin/rake"

set :application, "read"
# Local
set :repository, "."
set :deploy_via, :copy

set :scm, :git
# The release branch contains functional passwords and is not stored on github.
set :branch, "release"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# Remote
set :deploy_to, "/home/adingle/webapps/sandwich/release"

role :web, "web336.webfaction.com"                          # Your HTTP server, Apache/etc
role :app, "web336.webfaction.com"                          # This may be the same as your `Web` server
role :db,  "web336.webfaction.com", :primary => true # This is where Rails migrations will run

set :user, "adingle"
#set :scm_username, "adingle"
set :use_sudo, false
default_run_options[:pty] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  desc "Restarting nginx"
  task :restart do
    run "#{deploy_to}/../bin/restart"
  end
end

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
