get '/surveys/new' do 
  @new_survey = true #what is this for?
  erb :new_survey
end

post '/surveys/new' do
  new_survey = Survey.new(title: params[:title])
  if new_survey.save
    current_user.surveys << new_survey
    params[:question].each_value do |question_data|
        question = Question.new(content: question_data[":content"])
        question_data[":reply"].each_value do |reply|
          choice = Choice.new(reply: reply)
          question.choices << choice #IS THIS WHERE THE CHOICE IS BEING SAVED?
        end
        new_survey.questions << question #IS THIS WHERE THE QUESTION IS BEING SAVED?
      end
    redirect "/users/#{current_user.id}"
  else
    "ERROR MUTHAFUCKA" #this is a stub
  end
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id]) #include questions to reduce DB calls
  erb :take_survey
end

post '/surveys/:survey_id' do
  survey = Survey.find(params[:survey_id]) #why is this an instance variable?
  survey.questions.each_with_index do |question, index|
      answer = Answer.new
      choice = Choice.find(params["group#{index}"])
      choice.answers << answer
      current_user.answers << answer
    end
    completed = Completion.new
    current_user.completions << completed
    survey = Survey.find(params[:survey_id])
    survey.completions << completed
    redirect "/surveys/#{survey.id}/results"
end

get '/surveys/:survey_id/results' do
  @survey = Survey.find(params[:survey_id]) #include questions
  @graph_data, @graph_labels = @survey.extract_graph_data
  @chart = Gchart.pie_3d(:data => @graph_data, #why is graph_data an instance var?
                         :title => "#{@survey.title}", 
                         :size => '430x200', 
                         :bg => '0000FF00',
                         :theme => :keynote,
                         :labels => @graph_labels) #why is graph_labels an instance var?
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

get '/surveys/:survey_id/delete' do
  @survey = Survey.find(params[:survey_id])
  erb :delete_survey
end
# ^ nice

delete '/surveys/:survey_id' do
  Survey.find(params[:survey_id]).destroy
  redirect '/'
end

get '/surveys/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  erb :edit_survey
end

put '/surveys/:survey_id/edit' do
  params["question"].each do |question_id, question_data|
    question = Question.find(question_id)
    question.content = params["question"][question_id][":content"]      
    question.save 
  end
  params["choice"].each do |choice_id, choice_data|
    choice = Choice.find(choice_id)
    choice.reply = params["choice"][choice_id]
    choice.save
  end
  redirect "/"
end

