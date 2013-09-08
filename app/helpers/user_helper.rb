helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def signup
    @user = User.new(email: params[:email], password: params[:password], name: params[:name])
    if @user.save
      login
      redirect "/users/#{user.id}"
    else
      "Deal with errors..."
    end
  end

end

