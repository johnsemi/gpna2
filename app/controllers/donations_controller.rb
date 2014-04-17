class DonationsController < ApplicationController
    respond_to :html, :json, :xml

	 def new
    @member = Member.find(params[:member_id])
    @donation = Donation.new
  end

   #def create
   # 	@member = Member.find(params[:member_id])
   #   @donation = Donation.new
   # 	if @member.donations.create(params[:donation].permit(donation_params))
   # 		redirect_to member_path(@member), :notice => "Donation recorded."
 	#	 else
  #  		render 'new'
#		end
#  end

  def create
      @member = Member.find(params[:member_id])
      if @member.donations.create(params[:donation].permit(:amount, :donationdate, :note))
        redirect_to member_path(@member), :notice => "Donation recorded."
     else
        render 'new'
      end
  end

  def index
      @member = Member.find(params[:member_id])
      @donations = @member.donations
      respond_with @donations
  end

	def show
    	@member = Member.find(params[:member_id])
    	@donation = Donation.new
      respond_with @donation
    end

  def edit
      @member = Member.find(params[:member_id])
      @donation = @member.donations.find(params[:id])
    end

  	def destroy
	    @member = Member.find(params[:member_id])
	    @donation = @member.donations.find(params[:id])
	    @donation.destroy
	    redirect_to member_path(@member), :notice => "Donation deleted."
  end

  def update
    @member = Member.find(params[:member_id])
    @donation = @member.donations.find(params[:id])
    if @donation.update(donation_params) #params[:member].permit(:firstname, :lastname, :address1))
      redirect_to member_path(@member), :notice => "Donation was updated."
    else
      render 'edit'
    end
  end

    private
      def donation_params
      params.require(:donation).permit(:amount, :donationdate, :note)
    end

end
