namespace :dev do
  desc "Setup database and run migrations"
  task setup: :environment do
    if(Rails.env.development?)

    spinner = TTY::Spinner.new("[:spinner] Loading: ", format: :pong)
    spinner.auto_spin
    %x(rails db:drop db:create db:migrate db:seed)
    spinner.stop("Database setup complete. Migrations run and seed data loaded")
    else
      puts "This task is only for the development environment."
    end
  end

end
