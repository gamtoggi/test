set :application, "my_test"
#set :repository,  "set your repository location here"


default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :repository, "git@github.com:gamtoggi/test.git" # Your clone URL
set :scm, "git"
set :user, "gamtoggi"  # The server's user for deploys
set :scm_passphrase, "toggi9292"  # The deploy user's password

set :branch, "master" #You need to tell cap the branch to checkout during deployment:
set :deploy_via, :remote_cache #In most cases you want to use this option, otherwise each deploy will do a full repository clone every time.

set :deploy_to, "/home/gamtoggi/app"

set :user, "gamtoggi"
set :scm_username, "gamtoggi"
set :use_sudo, false

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "gameway.kr"                          # Your HTTP server, Apache/etc
role :app, "gameway.kr"                          # This may be the same as your `Web` server
role :db,  "gameway.kr", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end