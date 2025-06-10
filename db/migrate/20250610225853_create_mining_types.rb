class CreateMiningTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :mining_types do |t|
      t.string :name
      t.string :acronym

      t.timestamps
    end
  end
end
