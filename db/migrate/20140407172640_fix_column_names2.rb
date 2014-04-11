class FixColumnNames2 < ActiveRecord::Migration
  def change
  	 change_table :events do |t|
      t.rename :eventitle, :eventtitle
    end
  end
end
