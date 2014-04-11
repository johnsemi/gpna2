class EventsController < ApplicationController

	before_action :get_event, only: [:show, :edit, :update, :destroy]

	 def get_event
	 	@event = Event.find(params[:id])
	 end

	def new
  	  @event = Event.new
	end

	def create
	  @event = Event.new(event_params)
	  @event.save
	  redirect_to @event
	end
 
 	def show
	end

	def index
  		@events = Event.all
	end

	def edit
	end

	def update
	  if @event.update(event_params) 
	  	    redirect_to events_path, :notice => "Event was updated."
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @event.destroy
	 
	  redirect_to events_path, :notice => "Event has been deleted."

	end

	private
  		def event_params
    	params.require(:event).permit(:eventtitle, :eventlocation, :eventdate, :eventdescription)
   	end
end
