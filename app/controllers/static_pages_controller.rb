class StaticPagesController < ApplicationController
  def home
  	 @totalMembers = Member.count

     #@newMembers = Member.find(:all, :order => 'joindate', :limit => 10)
  	 @newMembers = Member.order(joindate: :desc).limit(5)
  	 @YTDMembers = Member.where(['joindate > ?', DateTime.now.beginning_of_year])

  	 @YTDDonations = Donation.where(['donationdate > ?', DateTime.now.beginning_of_year])

	 @upcomingEvents = Event.where(['eventdate > ?', DateTime.now]).order(eventdate: :asc).limit(5)
  end

  def help
  end

  def reports

	@donations = Donation.find(:all, :order => 'donationdate')
	@monthly_donations = @donations.group_by(&:month)

	@yearly_donations = @donations.group_by(&:year)

	@yearly_donations_sum = Hash.new
	@yearly_donations.each do |year, stats|  
	    count_array = stats.collect{|i| i.amount}
	    @yearly_donations_sum[year] = count_array.sum 
	end

	@monthly_donations_sum = Hash.new
	@monthly_donations.each do |month, stats|  
	    count_array = stats.collect{|i| i.amount}
	    @monthly_donations_sum[month] = count_array.sum 
	end

	@MTDDonations = Donation.where(['donationdate > ?', DateTime.now.beginning_of_month])

  end

  def subscriptions
  	#@members = Member.where(['subscribe = 1'])
  	@members = Member.subscribed
  	@member_emails = Hash.new
	@members.each do |m|  
	    @member_emails[m.display_name] = m.email 
	end
  end

def newmembers
  		@all_members = Member.group(:membertype).count
		@membertype_sum = Hash.new
		@all_members.each do |type, count|  
			typename = Member::MEMBER_TYPES.key(type)
	    	@membertype_sum[typename] = count 
		end

	  	@member_joins = Member.select("id", "joindate")
		@yearly_joins = @member_joins.group_by(&:year)
		@yearly_joins_sum = Hash.new
		@yearly_joins.each do |year, stats|  
		    count_array = stats.collect{|i| i.id}
		    @yearly_joins_sum[year] = count_array.count 
		end
  end

end
