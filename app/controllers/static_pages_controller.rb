class StaticPagesController < ApplicationController
  def home
  	 @totalMembers = Member.count

     #@newMembers = Member.find(:all, :order => 'joindate', :limit => 10)
  	 @newMembers = Member.order(joindate: :desc).limit(10)
  	 @YTDMembers = Member.where(['joindate > ?', DateTime.now.beginning_of_year])

  	 @YTDDonations = Donation.where(['donationdate > ?', DateTime.now.beginning_of_year])


	#@donations = Donation.group("donationdate").select("DATE_FORMAT(donationdate, '%Y-%m') AS d_month, sum(amount) AS d_total")

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

	@all_members = Member.group(:membertype).count
	@membertype_sum = Hash.new
	@all_members.each do |type, count|  
		typename = Member::MEMBER_TYPES.key(type)
	    @membertype_sum[typename] = count 
	end

	@members = Member.select("id", "joindate")
	@yearly_joins = @members.group_by(&:year)
	@yearly_joins_sum = Hash.new
	@yearly_joins.each do |year, stats|  
	    count_array = stats.collect{|i| i.id}
	    @yearly_joins_sum[year] = count_array.count 
	end
  end
end
