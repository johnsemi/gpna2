class AddJoinDateToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :joindate, :date
  end
end
