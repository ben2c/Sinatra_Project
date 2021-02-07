class ApplicationController < Sinatra::Base 

    configure do    
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, "secret"
        #set :show_exceptions, false  #enable in dev env by default

    end

    get '/' do 
        erb :root
    end

    get '/home' do 
        authorize
        erb :home
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    helpers do 
        def logged_in?
            !!Users.find_by(id: session[:user_id])
        end

        def current_user
            user = Users.find_by(id: session[:user_id])
            raise AuthError.new if user.nil?
            user
        end

        def authenticate(email, password)
            user = Users.find_by(email: email)
            raise AuthError.new unless !!user
            raise AuthError.new if !user.authenticate(password)
            session[:user_id] = user.id
            user
        end

        def authorize
            current_user
        end 

        def authorize_user(records)
            raise NoResourceError.new if !records
            raise AuthError.new if records.user != current_user
        end

        def login_error_messages(errors)
            if errors
                erb :'sessions/_errors', locals: {errors: errors}
            end
        end

        def check_records(records)
            current_user == records.user
        end

    end

    error AuthenError do 
        status AuthenError.status
        erb :error, locals: {msg: AuthenError.msg, links: AuthenError.links }, layout: false
    end

    error AuthorError do 
        status AuthorError.status
        erb :error, locals: {msg: AuthorError.msg, links: AuthorError.links }, layout: false
    end

end