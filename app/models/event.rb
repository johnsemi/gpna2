class Event < ActiveRecord::Base
	has_and_belongs_to_many :members

	def total_volunteers
 		 self.members.count(:member)
	end

  def eventtitle
     read_attribute(:eventtitle).try(:titleize)
  end

  def eventlocation
     read_attribute(:eventlocation).try(:titleize)
  end

end
