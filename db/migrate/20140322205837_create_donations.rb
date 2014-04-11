class CreateDonations < ActiveRecord::Migration
  def change
    drop_table :donations
    create_table :donations do |t|
      t.integer :amount
      t.date :date
      t.string :note
      t.references :member, index: true

      t.timestamps
    end
  end
end
