var namePresent = function (name) {
    if (name.length < 1) {
        // ^ pull out this append method from each validation and just store the full error message in the array
        return "Must have a name"; // why don't the messages match?
    }
};

var validateEmail = function (email) {
    if ((/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/).test(email) === false) {
        return "Must be valid email";
    }
};

var passwordHasNumber = function (password) {
    if ((/\d/).test(password) === false) {
        return "Password should have number";
    }
};

var validatePasswordLength = function (password) {
    if (password.length <= 6) {
        return "Password should have at least 6 characters";
    }
};

function renderErrors(functions) {
    var errors = []
    for (i = 0; i < functions.length; i++) {
        if (functions[i]){ 
          errors.push(functions[i])
        }
    }
    return errors
}

$(function () {
    $('#signup-form').on('submit', function (e) {
        $('#invalid-errors').empty();

        var nameInput = $('#signup-name[name="name"]').val();
        var emailInput = $('#signup-email[name="email"]').val();
        var passwordInput = $('#signup-password[name="password"]').val();
        var errors = renderErrors(
        [namePresent(nameInput),
        validateEmail(emailInput),
        passwordHasNumber(passwordInput),
        validatePasswordLength(passwordInput)])

        if (errors.length > 0) {
            e.preventDefault();
            for (i = 0; i < errors.length; i++) {
                $('#invalid-errors').append("<li class='signup-error'>" + errors[i] + "</li>")
            }
        }
    });
});
