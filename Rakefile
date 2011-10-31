# coding: utf-8
require "bundler"
Bundler.setup(:rakefile)

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

begin
  require "vlad"
  require "vlad/core"
  require "vlad/git"
  
  # Deploy config
  set :repository, "git@github.com:oleander/heartbeat.git"
  set :revision,   "origin/master"
  set :deploy_to,  "/opt/www/heartbeat.oleander.nu"
  set :domain,     "webmaster@burken"
  set :mkdirs,     ["."]
  set :shared_paths, {"vendor" => "vendor"}
  
  set :bundle_cmd, "bundle"
  set :god_cmd, "sudo /usr/bin/god"
  
  namespace :vlad do
    desc "Deploys a new revision of webbhallon and reloads it using God"
    task :deploy => ["update", "bundle", "god:reload", "god:restart", "cleanup"]
    
    remote_task :bundle do
      run "cd #{current_release} && #{bundle_cmd} install --without=rakefile,test --deployment"
    end
    
    namespace :god do
      remote_task :reload do
        run "#{god_cmd} load #{current_release}/em-worker.god"
      end
      
      remote_task :restart do
        run "#{god_cmd} restart em-worker"
      end
    end
  end
rescue LoadError => e
  warn "Some gems are missing, run `bundle install`"
  warn e.inspect
end