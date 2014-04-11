class Event < ActiveRecord::Base
	has_and_belongs_to_many :members

	def total_volunteers
 		 self.members.count(:member)
	end
end
