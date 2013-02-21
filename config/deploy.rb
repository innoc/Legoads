require 'bundler/capistrano'
require 'capistrano'
require 'capistrano-vexxhost'


# Account Settings

ssh_options[:forward_agent] = true

set :user, "innocent"
set :password, "2Q0bNx85it"
set :domain, "legoads.com"
set :mount_path,"/home/innocent/public_html"
set :application,"legoads"
set :scm, :git
set :scm_command, "/home/user/opt/bin/git"
#SSset :scm_command, "/opt/local/bin/git"
#SSSSSSset :local_scm_command, "git"
set :repository, "git@github.com:innoc/Legoads.git"
default_run_options[:pty] = true


