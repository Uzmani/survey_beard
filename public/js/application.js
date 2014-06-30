var choice = 2; // why are these variables in this scope?
var question = 1;

function growBeard(){
  $('#beard').fadeIn(2000);
  $('#beard').fadeOut(2000);
}

$(document).ready(function() {
  growBeard();

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
    });
      // think about pulling all these AJAX calls and other bound events into a named function, or even create an object like surveyUI that contains all the UI functions

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

  $('input.fake-btn').on('click', function(e){
    e.preventDefault();
    $('input#done').click();
  });



  $('#editable a').on('click', function(e){
    e.preventDefault();

    $.ajax({
      type: this.method,
      url: this.href,
      data: $(this).serialize()
    }).done(function(server_data){
      $('#editable').hide();
      $('#editor').html(server_data).removeClass('hidden');
    });




  });

});
