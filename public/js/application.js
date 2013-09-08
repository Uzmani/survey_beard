var choice = 2;
var question = 1;


$(document).ready(function() {
  $('form.add-choice').on('submit', function(e) {
    choice ++;
    console.log("click heard");
    e.preventDefault();
    console.log(this.action);
    $.ajax({
      type: this.method,
      url: this.action,
      data:{question_value: question, choice_value: choice}
    }).done(function(server_data) {
      $('.add-survey-content').append(server_data);
      // console.log("success " + server_data);
    });

  });

  $('form.add-question').on('submit', function(e) {
    choice = 2;
    question +=1;
    e.preventDefault();
    $.ajax({
      type: this.method,
      url: this.action,
      data:{question_value: question, choice_value: choice}
    }).done(function(server_data) {
      $('.add-survey-content').append(server_data);
    });
  });
  $('#survey-name-modal').on('click', function(){
    $('div#show-modal-btn').hide();
    var surveyName = $('input').val();
    $("#hidden-survey-title").val(surveyName);
    $(".new-survey-title h3").append(surveyName);

  });

  $('#untaken_surveys a').on('click', function(e){
    e.preventDefault();
      console.log($(this));
    $.ajax({
      type: this.method,
      url: this.href,
      data: $(this).serialize()
    }).done(function(server_data){
      $('#take_survey').html(server_data).removeClass('hidden');
    
      $('#untaken_surveys').hide();


    }); // .done from end of ajax
  }); // ends on click function

});
