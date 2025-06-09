namespace :dev do
  desc "Setup database and run migrations"
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed)
  puts "Database setup complete. Migrations run and seed data loaded."
  end
  
end
