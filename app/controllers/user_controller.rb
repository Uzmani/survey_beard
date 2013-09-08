# stuff for creating a user

# get "/login" do
#   erb :user_signup
# end

post "/users/new" do
  signup
  erb :index
end

get "/users/:user_id" do
  @user = User.find(params[:user_id])
  @survey = Survey.all

  erb :dashboard
end

