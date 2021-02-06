class AuthorError < Error
    @@msg = "Unauthorized to view"
    @@links = {"/home" => "Go Home" }
    @@status = 401

    def self.msg
        @@msg
    end

    def self.links
        @@links 
    end

    def self.status
        @@status 
    end
end