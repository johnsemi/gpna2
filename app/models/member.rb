class Member < ActiveRecord::Base
	has_many :donations, dependent: :destroy
	has_and_belongs_to_many :events
	validates :firstname, presence: true,
                    length: { minimum: 1 }

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
        
	#@@member_types = {"key1" => "text 1", "key2" => "text2"}
	#@@member_types = { 1 => 'Resident', 2 => 'Business', 3 => 'Organization'}
   
    #def membertype_text
    #  @@member_types[membertype]
    #end

    #def self.member_type_select
    #  @@member_types.invert
    #end
end
