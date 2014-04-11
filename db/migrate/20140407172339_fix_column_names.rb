class FixColumnNames < ActiveRecord::Migration
  def change
  	change_table :events do |t|
      t.rename :title, :eventtitle
      t.rename :location, :eventlocation
      t.rename :description, :eventdescription
    end
  end
end
