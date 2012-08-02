namespace :db do

  desc "Copy production database to local"
  task :sync_production_to_local => :environment do
    system 'mongodump -h flame.mongohq.com:27028 -d app4264979 -u heroku -p dd90ddd95207fb164720e1a3e0ea9918 -o db/backups/'
    system 'mongorestore -h localhost --drop -d blackdogproperty_development db/backups/app4264979/'
  end

  desc "Copy local backup to staging db"
  task :sync_local_from_production_to_staging => :environment do
    system 'mongorestore -h staff.mongohq.com:10049 --drop -d app5401656 -u heroku -p c2bc28206bc3813c0a5a2ba56b440013 db/backups/app4264979/' 
  end
  
  task :backup_local => :environment do
    system 'mongodump -h localhost -d blackdogproperty_development -o db/backups/'
  end

  task :sync_local_from_dev_to_staging => :environment do
    system 'mongorestore -h staff.mongohq.com:10049 --drop -d app5401656 -u heroku -p c2bc28206bc3813c0a5a2ba56b440013 db/backups/blackdogproperty_development/' 
  end

  desc "Copy staging database to local"
  task :sync_staging_to_local => :environment do
    system 'mongodump -h staff.mongohq.com:10049 -d app5401656 -u heroku -p c2bc28206bc3813c0a5a2ba56b440013 -o db/backups/'
    system 'mongorestore -h localhost --drop -d blackdogproperty_development db/backups/app5401656/'
  end

  desc "Copy local backup to production db"
  task :sync_local_to_production => :environment do
    system 'mongorestore -h flame.mongohq.com:27028 --drop -d app4264979 -u heroku -p dd90ddd95207fb164720e1a3e0ea9918 db/backups/app5401656/' 
  end

end
