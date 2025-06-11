namespace :dev do
  desc "Setup database and run migrations"
  task setup: :environment do
    if Rails.env.development?
      active_spinner("Dropping Database...") { %x(rails db:drop) }
      active_spinner("Creating Database...") { %x(rails db:create) }
      active_spinner("Migrating Database...") { %x(rails db:migrate) }
      %x(rails dev:import_coins)
      %x(rails dev:import_mining_type)
    else
      puts "This task is only for the development environment."
    end
  end

  desc "Import coins"
  task import_coins: :environment do
    if Rails.env.development?
      active_spinner("Importing Coins...") do
        coins = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://png.pngtree.com/png-clipart/20211212/original/pngtree-bitcoin-png-png-image_6961160.png"
          },
          {
            description: "Etherium",
            acronym: "ETH",
            url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5JfenCFa1c9KP4-LQZ1TzP-tMMPiXYG1NyQ&s"
          },
          {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://gallery.yopriceville.com/downloadfullsize/send/21848"
          }
        ]

        coins.each do |coin|
          Coin.find_or_create_by!(coin)
        end
      end
    else
      puts "This task is only for the development environment."
    end
  end

  desc "Import Mining Types"
  task import_mining_type: :environment do
    if Rails.env.development?
      active_spinner("Importing Mining Types...") do

        mining_types = [
          {
            name: "Pool of Mining",
            acronym: "POW",
          },
          {
            name: "Proof of Stake",
            acronym: "POS"
          }
        ]
        mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
        end
      end
    else
     puts "This task is only for the development environment."
    end
  end
end

private
def active_spinner(type_message, end_message = "Done!")
  spinner = TTY::Spinner.new("[:spinner] #{type_message}", format: :classic, hide_cursor: true)
  spinner.auto_spin
  yield
  spinner.success(end_message)
end
