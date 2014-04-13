class DonationsController < ApplicationController
	 
   def create
    	@member = Member.find(params[:member_id])
    	if @member.donations.create(params[:donation].permit(:amount, :donationdate, :note))
    		redirect_to member_path(@member), :notice => "Donation recorded."
 		 else
    		render 'new'
  		end
  end

	def show
    	@member = Member.find(params[:member_id])
    	@donation = @member.donations.find(params[:id])
    end

  def edit
      @member = Member.find(params[:member_id])
      @donation = @member.donations.find(params[:id])
    end

  	def destroy
	    @member = Member.find(params[:member_id])
	    @donation = @member.donations.find(params[:id])
	    @donation.destroy
	    redirect_to member_path(@member)
  end
end
