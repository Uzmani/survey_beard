helpers do

  # ^ can be replaced by user.created_surveys alias
  # def surveys_taken_by_user
  #   taken_surveys = []
  #   current_user.completions.each do |completed|
  #     taken_surveys << Survey.find(completed.survey_id)
  #   end
  #   taken_surveys
  # end
  # # ^ can be replaced by user.taken_surveys alias *****
  # def surveys_not_taken
  #   Survey.all - surveys_taken_by_user
  # end
  # ^ I like this, but move into the User model *****
  # def make_new_survey
  #   @new_survey = Survey.create(title: params[:title])
  # end
  # ^ no point in using the instance variable at all here, and actually this can just go in the controller
  # def assign_new_survey_to_current_user
  #   current_user.surveys << @new_survey
  # end
  # ^ can go in the controller
  # def save_questions_and_choices_to_db_as_part_of_new_survey
  #   params[:question].each_value do |question_data|
  #     @question = Question.new(content: question_data[":content"])
  #     question_data[":reply"].each_value do |reply|
  #       @choice = Choice.new(reply: reply)
  #       @question.choices << @choice
  #     end
  #     @new_survey.questions << @question
  #   end
  # end
  # ^ either find a way to make this make sense in a model, or put it in the controller
  # def store_user_answers
  #   @survey.questions.each_with_index do |question, index|
  #     answer = Answer.new
  #     choice = Choice.find(params["group#{index}"])
  #     choice.answers << answer
  #     current_user.answers << answer
  #   end
  # end
  # okay all of this just needs to go into the controller. or the model. move it into the controller first and refactor into the model if you can. and remember that the model can't know about params unless the params are passed along as an argument.
  # def record_completion_of_survey_by_user
  #   completed = Completion.new
  #   current_user.completions << completed
  #   @survey = Survey.find(params[:survey_id])
  #   @survey.completions << completed
  # end

  # def store_incremented_choice_number_as_variable
  #   @choice_value = params[:choice_value]
  # end

  # def store_incremented_question_number_as_variable
  #   @question_value = params[:question_value]
  # end

  # def extract_graph_data(survey)
  #   @graph_labels = []
  #   @graph_data = []
  #   survey.questions.first.choices.each do |choice|
  #     @graph_labels << choice.reply
  #     @graph_data <<  choice.answers.length
  #   end
  # end

  # def save_changes_to_questions_and_choices
  #   params["question"].each do |question_id, question_data|
  #     question = Question.find(question_id)
  #     question.content = params["question"][question_id][":content"]
  #     question.save 
  #   end
  #   params["choice"].each do |choice_id, choice_data|
  #     choice = Choice.find(choice_id)
  #     choice.reply = params["choice"][choice_id]
  #     choice.save
  #   end
  # end


end









