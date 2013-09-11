# stuff for creating a user

# get "/login" do
#   erb :user_signup
# end
# ^ (why is this route commented out? -lla)

post "/users/new" do
  signup
  erb :index
end

get "/users/:user_id" do
	#set the user and include :taken_surveys and :created_surveys in the call and pass in locals instead of using the helpers
	#see http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations
  erb :dashboard
end

