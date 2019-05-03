class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :calendar_id
      t.string :visibility
      t.string :organizer
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :end
      t.string :location
      t.integer :afterthought_id

      t.timestamps
    end
  end
end
