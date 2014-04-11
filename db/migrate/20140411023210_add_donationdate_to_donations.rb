class AddDonationdateToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donationdate, :date
  end
end
