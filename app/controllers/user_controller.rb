# stuff for creating a user

# get "/login" do
#   erb :user_signup
# end
# ^ (why is this route commented out? -lla)

post "/users/new" do
  @user = User.new(email: params[:email], password: params[:password], name: params[:name])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{current_user.id}" 
  else
    "Deal with errors..."
    # reload the signup form with errors dispayed
    # also, client-side form validations will reduce the likelihood of getting to this point
  end
end

get "/users/:user_id" do
	#set the user and include :taken_surveys and :created_surveys in the call and pass in locals instead of using the helpers
	#see http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations
  erb :dashboard
end

