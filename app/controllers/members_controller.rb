class MembersController < ApplicationController


	before_action :get_member, only: [:show, :edit, :update, :destroy]

	 def get_member
	 	@member = Member.find(params[:id])
	 end

	def new
		@member = Member.new
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
  		@members = Member.all
	end

	def update
	 # @member = Member.find(params[:id])
	 
	  if @member.update(member_params) #params[:member].permit(:firstname, :lastname, :address1))
	    redirect_to members_path, :notice => "Member was updated."
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
    	params.require(:member).permit(:firstname, :lastname, :orgname, :address1, :address2, :city, :state, :zip, :phone, :email, :subscribe)
  	end
end