class CreateAfterthoughtAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :afterthought_attendees do |t|
      t.integer :attendee_id
      t.integer :afterthought_id

      t.timestamps
    end
  end
end
