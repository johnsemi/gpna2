class ChartsController < ApplicationController
	def yearly_donations
		@donations = Donation.find(:all, :order => 'donationdate')
		@yearly_donations = @donations.group_by(&:year)
		@gd = Hash.new
		@yearly_donations.each do |year, stats|  
		    count_array = stats.collect{|i| i.amount}
		    @gd[year] = count_array.sum 
		end
		render :json => @gd
  end



def yearly_donations_new
  @donations = Donation.includes(:amount, :donationdate).group(&:year).sum("amount")
  respond_to do |format|
    format.html
    format.json do
      render :json => custom_json_for(@donations)
    end
  end
end



  	def member_types
    	render json: Member.group(:membertype).count
  end

  def yearly_members
  	render json: Member.group_by_year(:joindate).count
  end


end
