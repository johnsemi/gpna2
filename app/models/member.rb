class Member < ActiveRecord::Base
	has_many :donations, dependent: :destroy
	has_and_belongs_to_many :events
	validates :firstname, presence: true,
                    length: { minimum: 1 }

    def total_donations
 		 self.donations.sum(:amount)
	end

    def last_donation
 		 self.donations.maximum(:created_at)
	end

end
