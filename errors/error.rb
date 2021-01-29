class Error < StandardError
    def self.msg
        @@msg ||= "Something Wrong Happened"
    end

    def self.status 
        @@status ||= 500

    def self.links
        @@links ||= []
    end

end

