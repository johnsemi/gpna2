class CreateEvents < ActiveRecord::Migration
  def change
    drop_table :events
    create_table :events do |t|
      t.string :eventtitle
      t.string :eventlocation
      t.text :eventdescription
      t.date :eventdate

      t.timestamps
    end

    create_table :events_members do |t|
      t.belongs_to :event
      t.belongs_to :member
    end
  end
end
