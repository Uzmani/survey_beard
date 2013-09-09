$(function(){
  $('#signup-form').on('submit', function(e){
    $('#invalid-errors').empty();

    var errors = [];
    var nameInput = $('#signup-name[name="name"]').val();
    var emailInput = $('#signup-email[name="email"]').val();
    var passwordInput = $('#signup-password[name="password"]').val();

    namePresent(nameInput, errors);
    validateEmail(emailInput, errors);
    passwordHasNumber(passwordInput, errors);
    validatePasswordLength(passwordInput, errors);
    console.log(errors);
    if (errors.length > 0){
      e.preventDefault();
    }
  });  
});


var namePresent = function(name, s) {
  if (name.length < 1) {
    $('#invalid-errors').append("<li class='signup-error'>Must enter your name</li>");
    s.push("Must have a name");
  }
};

var validateEmail = function(email, s) {
  if ((/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/).test(email) === false){
    $("#invalid-errors").append("<li class='signup-error'>Must be a valid email address</li>");
    s.push("Must be valid email");
  }
};

var passwordHasNumber = function(password, s) {
  if ((/\d/).test(password) === false){
    $('#invalid-errors').append("<li class='signup-error'>Password must have at least one number</li>");
    s.push("Password should have number");
  }
};

var validatePasswordLength = function(password, s) {
  if (password.length <= 6){
    $('#invalid-errors').append("<li class='signup-error'>Password must be at least 6 characters long</li>");
    s.push("Password should have at least 6 characters");
  }
};