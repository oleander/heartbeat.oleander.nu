# coding: utf-8
require "bundler"
Bundler.setup(:rakefile)

begin
  require "vlad"
  require "vlad/core"
  require "vlad/git"
  
  # Deploy config    
  set :repository,   "git@github.com:oleander/heartbeat.git"
  set :revision,     "origin/master"
  set :deploy_to,    "/opt/www/heartbeat.oleander.nu"
  set :domain,       "webmaster@burken"
  set :mkdirs,       ["."]
  set :skip_scm,     false
  set :shared_paths, {"vendor" => "vendor"}
  
  set :bundle_cmd, "bundle"
  
  namespace :vlad do
    desc "Deploys a new revision of webbhallon and reloads it using God"
    task :deploy => ["update", "bundle", "cleanup"]
    
    remote_task :bundle do
      run "cd #{current_release} && #{bundle_cmd} install --without=rakefile,test --deployment"
    end    
  end
rescue LoadError => e
  warn "Some gems are missing, run `bundle install`"
  warn e.inspect
end