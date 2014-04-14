class Donation < ActiveRecord::Base
  belongs_to :member
  validates :amount, presence: true
	
  def donation_month
     self.donationdate.month
  end	

  def donation_year
     self.donationdate.year
  end	

end
