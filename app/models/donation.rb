class Donation < ActiveRecord::Base
  belongs_to :member
  validates :amount, presence: true
	
end
