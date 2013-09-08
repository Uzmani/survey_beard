get '/surveys/new' do 
  #AR create new survey
  @new_survey = true
  erb :new_survey
end

post '/surveys/new' do
  # if survey wasn't successfully created, render message
  puts "new survey params here--------------------------------------"
  @new_survey = Survey.create(title: params[:title])
  current_user.surveys << @new_survey 
  p params[:question]
  # p params[:question]
  # p params[:choice][0]
  
    params[:question].each_value do |question_data|
      @question = Question.new(content: question_data[":content"])
        question_data[":reply"].each_value do |reply|
          @choice = Choice.new(reply: reply)
          @question.choices << @choice
        end
        @new_survey.questions << @question
    end

    # params[:question].each do |key, content_hash|
    #   content_hash.each do |content, string|
    #     @new_question = Question.create(content: string)
    #     @new_survey.questions << @new_question
    #   end  
    #   params[:choice].each do |choice_hash|
    #     choice_hash. each do |reply, string|
    #       @new_choice = Choice.create(reply: string)
    #       @new_question.choices << @new_choice
    #     end
    #   end
    # end
  puts "=====================showing questions in survey"
  p @new_survey.questions
  puts "=====================new question object"
  p @new_question
  # current_user.surveys
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

  completed = Completion.new
  current_user.completions << completed
  survey.completions << completed

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
