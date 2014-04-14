class StaticPagesController < ApplicationController
  def home
  	 @totalMembers = Member.count

     @newMembers = Member.find(:all, :order => 'joindate, id', :limit => 10)
  	 


	#@donations = Donation.group("donationdate").select("DATE_FORMAT(donationdate, '%Y-%m') AS d_month, sum(amount) AS d_total")

	 @upcomingEvents = Event.where(['eventdate > ?', DateTime.now]).order(eventdate: :asc).limit(5)
  end

  def help
  end

  def reports
  	     
	@donations = Donation.find(:all, :order => 'donationdate')
	@monthly_donations = @donations.group_by(&:month)

	@yearly_donations = @donations.group_by(&:year)
  end
end
