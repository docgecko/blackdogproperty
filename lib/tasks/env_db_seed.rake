require 'open-uri'

namespace :db do
  task :seed => :environment do
    env_seed_file = File.join(Rails.root, 'db', 'seeds', "#{Rails.env.downcase}.rb")
    load(env_seed_file) if File.exist?(env_seed_file)
  end
end