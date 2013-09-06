helpers do

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/users/#{current_user.id}"
    else
      erb :auth_errors
    end
  end

  def logout
    session.clear
    redirect "/"
  end

end

