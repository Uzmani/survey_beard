$(function(){
  $('signup-btn').on('submit', function(e){
    $('#errors').empty();
    var nameInput = $('input [name="name"]')
    var emailInput = $('input[name="email"]').val();
    var passwordInput = $('input[name="password]').val();
    namePresent(nameInput);
    validateEmail(emailInput);
    passwordHasNumber(passwordInput);
    passwordHasUppercase(passwordInput);
    validatePasswordLength(passwordInput);
  });  
});


var namePresent = function(name) {
  if (name.length < 1) {
    $('#invalid-errors').append("<li>Must enter your name</li>";)
  }
};

var validateEmail = function(email) {
  if ((/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/).test(email) === false){
    $("#invalid-errors").append("<li>Must be a valid email addres</li>");
  }
};

var passwordHasNumber = function(password) {
  if ((/\d/).test(password) === false){
    $('#invalid-errors').append("<li>Password must have at least one number</li>");
  }
};

var passwordHasUppercase = function(password) {
  if ((/[A-Z]/).test(password) === false) {
    $('#invlalid-errors').append("<li>Password must have at least one capital lettert</li>");
  }
};

var validatePasswordLength = function(password) {
  if (password.length <= 6){
    $('#invalid-errors').append("<li>Password must be at least 6 characters long</li>");
  }
};