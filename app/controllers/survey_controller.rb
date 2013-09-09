get '/surveys/new' do 
  @new_survey = true
  erb :new_survey
end

post '/surveys/new' do
  make_new_survey
  assign_new_survey_to_current_user
  save_questions_and_choices_to_db_as_part_of_new_survey
  redirect "/users/#{current_user.id}"
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :take_survey
end

post '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  store_user_answers
  record_completion_of_survey_by_user
  redirect "/surveys/#{@survey.id}/results"
end

get '/surveys/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  extract_graph_data(@survey)
  @chart = Gchart.pie_3d(:data => @graph_data, 
                         :title => "#{@survey.title}", 
                         :size => '430x200', 
                         :bg => '0000FF00',
                         :theme => :keynote,
                         :labels => @graph_labels)
  erb :results
end

get '/surveys/new/choices/new' do
  store_incremented_choice_number_as_variable
  store_incremented_question_number_as_variable
  erb :_add_choice , :layout => false
end

get '/surveys/new/questions/new' do
  store_incremented_choice_number_as_variable
  store_incremented_question_number_as_variable
  erb :_add_question , :layout => false
end

get '/surveys/:survey_id/delete' do
  @survey = Survey.find(params[:survey_id])
  erb :delete_survey
end

delete '/surveys/:survey_id' do
  Survey.find(params[:survey_id]).destroy
  redirect '/'
end

get '/surveys/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  erb :edit_survey
end

put '/surveys/:survey_id/edit' do
  p params
  save_changes_to_questions_and_choices
  redirect "/"
end

