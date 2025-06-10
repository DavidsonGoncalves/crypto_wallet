namespace :dev do
  desc "Setup database and run migrations"
  task setup: :environment do
    if(Rails.env.development?)

    active_spinner("Dropping Database...") {%x(rails db:drop)}
    active_spinner("Creating Database...") {%x(db:create)}
    active_spinner("Migrating Database...") {%x(db:migrate)}
    active_spinner("Populating Database...") {%x(db:seed)}
    else
      puts "This task is only for the development environment."
    end
  end

  def active_spinner(type_message,end_message = "Done!")
    spinner = TTY::Spinner.new("[:spinner] #{type_message}", format: :classic, hide_cursor: true)
    spinner.auto_spin
    yield
    spinner.success(end_message)
  end

end
