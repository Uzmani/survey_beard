get '/surveys/new' do 
  #AR create new survey
  puts "wrong route executed"
  erb :new_survey
end

post '/surveys/new' do
  # if survey wasn't successfully created, render message
  p params
  redirect "/users/#{current_user.id}"
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :take_survey
end

post '/surveys/:survey_id' do
  # p params
  #we're going to use the survey_id to iterate through
  #the questions. for each question, we're going to create
  #an answer object, and shovel that answer into the appropriate
  #choices.answers array, and into the appropriate user.answers
  #array
  survey = Survey.find(params[:survey_id])
  survey.questions.each_with_index do |question, index|
    answer = Answer.new
    choice = Choice.find(params["group#{index}"])
    choice.answers << answer
    p current_user
    current_user.answers << answer
  end

  redirect "/surveys/#{survey.id}/results"
end

get '/surveys/:survey_id/results' do

  erb :results
end

get '/surveys/new/choices/new' do
  @choice_value = params[:choice_value]
  @question_value = params[:question_value]
erb :_add_choice , :layout => false
end

get '/surveys/new/questions/new' do
  @choice_value = params[:choice_value]
  @question_value = params[:question_value]
  erb :_add_question , :layout => false
end
