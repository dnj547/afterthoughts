class CreateAfterthoughts < ActiveRecord::Migration[5.2]
  def change
    create_table :afterthoughts do |t|
      t.string :actual_location
      t.datetime :actual_start
      t.datetime :actual_end
      t.text :actual_description
      t.text :thoughts
      t.integer :rating
      t.integer :event_id

      t.timestamps
    end
  end
end
