class GeneralError < StandardError

    def self.msg
        @@msg ||= "Something Wrong Happened"
    end

    def self.status 
        @@status ||= 500
    end

    def self.links
        @@links ||= []
    end

end

