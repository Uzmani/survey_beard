helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # ^ this is the only helper you should have right now, and that's because this is really the only helper you might use in a view. helpers are for views.

  def logged_in?
    current_user
  end
  # ^ this method is redundant. instead of checking for logged_in?, just check for current_user

  def signup
    @user = User.new(email: params[:email], password: params[:password], name: params[:name])
    if @user.save
      login
      redirect "/users/#{user.id}"
    else
      "Deal with errors..."
      # reload the signup form with errors dispayed
      # also, client-side form validations will reduce the likelihood of getting to this point
    end
  end
  # ^ move to controller

end

