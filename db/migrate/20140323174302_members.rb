class Members < ActiveRecord::Migration
  def change
  	drop_table :members
  	 create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.string :orgname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :email
      t.integer :membertype
      t.integer :subscribe
      t.date :joindate
      t.date :expiredate

      t.timestamps
  end
  end
end
