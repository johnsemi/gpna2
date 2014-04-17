class Member < ActiveRecord::Base
	has_many :donations, dependent: :destroy
	has_and_belongs_to_many :events
	validates :firstname, presence: true, length: { minimum: 1 }
    validates :lastname, presence: true
    validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
                     :message => 'Please provide a valid e-mail address'},
        :allow_blank => true
    validates :joindate, presence: true
    validates_presence_of :orgname, :if => :is_biz?
    validates_presence_of :email, :if => :is_subscribed?

    attr_reader :listing_name

    def firstname=(s)
        super s.titleize
    end
    
    def lastname=(s)
        super s.titleize
    end

    def orgname=(s)
        super s.titleize
    end

    def total_donations
 		 self.donations.sum(:amount)
	end

    def last_donation
 		 self.donations.maximum(:created_at)
	end

    def is_expired
        if self.last_donation > (Time.now - (365*24*60*60))
            return false
        else
            return true
        end
    end

    def is_biz?
        !(membertype == 1)
    end

    def is_subscribed?
        subscribe == 1
    end

    scope :expired, -> { where(self.donations.maximum(:created_at) > (Time.now - (365*24*60*60))) }

    scope :subscribed, -> { where(subscribe: 1) }

    def display_name
        if membertype == 1
            return "#{firstname.titleize} #{lastname.titleize}"
        else
            return "#{orgname.titleize} (#{firstname.titleize} #{lastname.titleize})"
        end
    end

    def listing_name
        if membertype == 1
            return "#{lastname.titleize}, #{firstname.titleize}"
        else
            return "#{orgname.titleize} (#{firstname.titleize} #{lastname.titleize})"
        end
    end

    def year
     self.joindate.strftime("%G")
    end

    MEMBER_TYPES = {'Resident' => 1, 'Business' => 2, 'Organization' => 3}

    SUBSCRIBE_YN = {'No' => 0, 'Yes' => 1}
        
end
