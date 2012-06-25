namespace :db do

  desc "Copy production database to local"
  task :sync_production_to_local => :environment do
    system 'mongodump -h flame.mongohq.com:27028 -d app4264979 -u heroku -p dd90ddd95207fb164720e1a3e0ea9918 -o db/backups/'
    system 'mongorestore -h localhost --drop -d blackdogproperty_development db/backups/app4264979/'
  end

  desc "Copy local backup to staging db"
  task :sync_backup_to_staging => :environment do
    system 'mongorestore -h staff.mongohq.com:10049 --drop -d app5401656 db/backups/app4264979/ -u heroku -p c2bc28206bc3813c0a5a2ba56b440013' 
  end

end
