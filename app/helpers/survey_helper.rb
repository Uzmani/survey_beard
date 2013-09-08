helpers do

  def surveys_created_by_this_user
    current_user.surveys
  end

  def surveys_taken_by_user
    taken_surveys = []
    current_user.completions.each do |completed|
      taken_surveys << Survey.find(completed.survey_id)
    end
    taken_surveys
  end

  def surveys_not_taken
    Survey.all - surveys_taken_by_user
  end

end
