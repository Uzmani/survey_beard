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
  p surveys_created_by_this_user
  erb :dashboard
end

