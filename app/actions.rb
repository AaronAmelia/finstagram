#  When a browser requests the root of the application
get '/' do
   
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)
# Stop
end

get '/signup' do        #if a new user navigates to the path "/signup",
    @user = User.new    #setup empty @user object
    erb(:signup)        # render "app/view/signup.erb"
end

post '/signup' do
    
    # grab user input vales from params
    email       = params[:email]
    avatar_url  = params[:avatar_url]
    username    = params[:username]
    password    = params[:password]

    # instantiate and save a User
    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    
    # if user validations pass and user is saved
    if @user.save

        "User #{username} saved!"

    else

        erb(:signup)

    end
end
