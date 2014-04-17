class MembersController < ApplicationController
	before_action :get_member, only: [:show, :edit, :update, :destroy]
  
  	respond_to :html, :json, :xml

	 def get_member
	 	@member = Member.find(params[:id])
	 end

	def index
  		@members = Member.order('UPPER(CASE membertype WHEN 1 THEN lastname ELSE orgname END) asc')
  		respond_with @members
	end

	def show
  		respond_with @member
	end

	def new
		@member = Member.new
		#Default selections for drop-downs, only applies to NEW
		@member.state = 'MI'
		@member.membertype = 1
	end

  	def create
  		@member = Member.new(member_params)
 	
 	 	if @member.save
    		respond_with @member, :notice => "Member was saved."
 		 else
    		render 'new'
  		end
	end


	def edit
	end

	def update
		if @member.update(member_params) 
		    respond_with @member, :notice => "Member was updated."
		else
		    render 'edit'
		end
	end

	def destroy
	  @member.destroy
	 
		respond_to do |format|
			format.html { redirect_to members_path, :notice => "Member has been deleted."}
	  		format.json { head :ok }
	  	end

	end

	private
  	def member_params
    	params.require(:member).permit(:firstname, :lastname, :orgname, :joindate, :address1, :address2, :city, :state, :zip, :phone, :email, :membertype, :subscribe)
  	end

end