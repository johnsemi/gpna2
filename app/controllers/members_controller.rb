class MembersController < ApplicationController
	before_action :get_member, only: [:show, :edit, :update, :destroy]
  
	 def get_member
	 	@member = Member.find(params[:id])
	 end

	def new
		@member = Member.new
		@member.state = 'MI'
		@member.membertype = 1
	end

  	def create
  		@member = Member.new(member_params)
 	
 	 	if @member.save
    		redirect_to @member, :notice => "Member was saved."
 		 else
    		render 'new'
  		end
	end
 
 	def show
  		#@member = Member.find(params[:id])
	end

	def edit
  		#@member = Member.find(params[:id])
	end

	def index
		#@members = Member.find(
        #     :all, 
        #     :select => "members.*, CASE WHEN membertype = 1 THEN
        #   	      lastname + ', ' + firstname
        #      ELSE
        #        orgname + ' (' + firstname + ' ' + lastname + ')'
        #       END as listing_name",
        #     :order  => params[:sort]
#)
  		@members = Member.all
	end

	def update
	 # @member = Member.find(params[:id])
	 
	  if @member.update(member_params) #params[:member].permit(:firstname, :lastname, :address1))
	    redirect_to @member, :notice => "Member was updated."
	    #redirect_to @member
	  else
	    render 'edit'
	  end
	end

	def destroy
	  #@member = Member.find(params[:id])
	  @member.destroy
	 
	  redirect_to members_path, :notice => "Member has been deleted."

	end

	private
  	def member_params
    	params.require(:member).permit(:firstname, :lastname, :orgname, :joindate, :address1, :address2, :city, :state, :zip, :phone, :email, :membertype, :subscribe)
  	end

end