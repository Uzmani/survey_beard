get '/' do
 	if current_user	# use -> if current_user
  	redirect "/users/#{current_user.id}"
	else
	  erb :index
	end
end

get '/test' do	# what is this? test.erb doesn't exist
	erb :test
end

