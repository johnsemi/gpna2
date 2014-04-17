class EventsController < ApplicationController

	before_action :get_event, only: [:show, :edit, :update, :destroy]

  	respond_to :html, :json, :xml

	 def get_event
	 	@event = Event.find(params[:id])
	 end

	def new
  	  @event = Event.new
	end

	def create
	  @event = Event.new(event_params)
 	 	if @event.save
    		respond_with @event, :notice => "Event was saved."
 		 else
    		render 'new'
  		end
	end
 
 	def show
	end

	def index
  		@events = Event.find(:all, :order => 'eventdate')
  		respond_with @events
	end

	def edit
	end

	def update
	  if @event.update(event_params) 
	  	   respond_with @event, :notice => "Event was updated."
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @event.destroy
	 
	  	respond_to do |format|
			format.html { redirect_to events_path, :notice => "Event has been deleted."}
	  		format.json { head :ok }
	  	end

	end

	private
  		def event_params
    	params.require(:event).permit(:eventtitle, :eventlocation, :eventdate, :eventdescription)
   	end
end
