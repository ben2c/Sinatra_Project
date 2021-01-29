class AuthError < Error
    @@msg = "Unable to authenticate"
    @@status = 401
    @@links = {'/login' => 'Log In', '/signup' => 'Sign Up'}

    def self.msg
        @@msg
    end

    def self.status
        @status
    end

    def self.links
        @@links
    end