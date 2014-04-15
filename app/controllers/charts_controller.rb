class ChartsController < ApplicationController
	def yearly_donations
		@donations = Donation.find(:all, :order => 'donationdate')
		@yearly_donations = @donations.group_by(&:year)

		@yearly_donations_sum = Hash.new
		@yearly_donations.each do |year, stats|  
	  	  	count_array = stats.collect{|i| i.amount}
	    	@yearly_donations_sum[year] = count_array.sum 
		end
		render :json => @yearly_donations_sum
  	end

  	def member_types
  		@all_members = Member.group(:membertype).count
		@membertype_sum = Hash.new
		@all_members.each do |type, count|  
			typename = Member::MEMBER_TYPES.key(type)
	    	@membertype_sum[typename] = count 
		end
    	render json: @membertype_sum
  	end

  def yearly_members
	  	@members = Member.select("id", "joindate")
		@yearly_joins = @members.group_by(&:year)
		@yearly_joins_sum = Hash.new
		@yearly_joins.each do |year, stats|  
		    count_array = stats.collect{|i| i.id}
		    @yearly_joins_sum[year] = count_array.count 
		end
		render json: @yearly_joins_sum
  end


end
