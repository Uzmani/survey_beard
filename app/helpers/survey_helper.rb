helpers do

  def surveys_created_by_this_user
    current_user.surveys
  end

end
