class AddMIningTypeToCoins < ActiveRecord::Migration[8.0]
  def change
    add_reference :coins, :mining_type, null: false, foreign_key: true
  end
end
