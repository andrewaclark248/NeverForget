$(document).ready(function(){

    //payment panel
    $("#payment_plan").on('change', function() {
        var selectedPlan = this.value 
        var updatedValue = null;
        var phoneCount = null;

        if (selectedPlan == "Bronze") {
            updatedValue = "$0.00/Month"
            phoneCount = "0 Phones"
        } else if (selectedPlan == "Silver") {
            updatedValue = "$5.00/Month"
            phoneCount = "1 Phone"
        } else if (selectedPlan == "Platnium") {
            updatedValue = "$8.00/Month"
            phoneCount = "2 Phones"
        } else if (selectedPlan == "Gold") {
            updatedValue = "$12.00/Month"
            phoneCount = "3 Phones"
        } else if (selectedPlan == "Adamantium") {
            updatedValue = "$16.00/Month"
            phoneCount = "4 Phones"
        } else {
            updatedValue = "No Plan Selected!"
            phoneCount = "0 Phones"
         }
        $("#upgraded-plan").text(updatedValue);

        $("#phone-count").text(phoneCount)

    });

    $('.toast').toast('show');


    // Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
    })


    //auto rotate button
    $( ".manually-rotate-password" ).click(function() {
        getNewPassword();
    });

    //delete password
    $( ".delete-password" ).click(function(e) {
        var passwordId = e.currentTarget.getAttribute('value')
        var deletePasswordUrl = "/user_passwords/" + passwordId.toString()
        
        $(".delete-password-accept").attr("href", deletePasswordUrl);
        getCurrentPassword(passwordId)
    });

    $( ".password-strength-analyzer" ).hide();

    //password strength progress bar
    $( "#password_password" ).focus(function(e) {
        var password = e.currentTarget.value
       if (password?.length > 0) {
            $( ".password-strength-analyzer" ).show();
       } else {
            $( ".password-strength-analyzer" ).hide();
       }
    });

    $('#password_password').blur(function(e) {
        $( ".password-strength-analyzer" ).hide();
        //auto set text to danger on blur
        $(".hasUpperAndLower").removeClass("text-success")
        $(".hasUpperAndLower").addClass("text-danger")

        $(".has12Char").removeClass("text-success")
        $(".has12Char").addClass("text-danger")

        $(".hasLetterAndNumbers").removeClass("text-success")
        $(".hasLetterAndNumbers").addClass("text-danger")

        $(".hasSpecialChar").removeClass("text-success")
        $(".hasSpecialChar").addClass("text-danger")
     });

    //$( "#password_password" ).change(function() {
    //    console.log("this is working");
    //});

    $('#password_password').on('input',function(e){
        var password = e.target.value;
        if (password?.length > 0) {
            //show password progress bar
            $( ".password-strength-analyzer" ).show();

            //analyze password
            getPasswordStength(password)

            var passwordStrength = getPasswordStatus(password)
            //console.log("strenght = " + (passwordStrength == 3))
            removeTextClasses()
            changePasswordStatusText(passwordStrength)
            changePasswordStatusBar(passwordStrength)
        } else {
            $( ".password-strength-analyzer" ).hide();
        }
    });

});

//manually generate password
function getNewPassword()
{
    $.ajax({

        url : '/ajax/get_new_password',
        type : 'GET',
        dataType:'json',
        success : function(data) { 
            $(".new-password").text(data.password);  
            $("#password_password").val(data.password)
            $(".current-username").text("some text haha"); 
        },
        error : function(request,error)
        {
            console.log("error")
        }
    });
}

//get current password (for delete)
function getCurrentPassword(passwordId) {
    var url = '/ajax/get_password/' + passwordId.toString()
    $.ajax({
        
        url : url,
        type : 'GET',
        dataType:'json',
        success : function(data) { 
            $(".current-username").text(data.username); 
            $(".current-password").text(data.password); 
        },
        error : function(request,error)
        {
            console.log("error")
        }
    });
}


function hasLowerCase(str) {
    return (/[a-z]/.test(str));
}

function hasUpperCase(str) {
    return (/[A-Z]/.test(str));
}

function hasTwelveChar(password) {
    if(password.length >= 12) {
        return true
    } else {
        return false
    }
}

function hasLettersAndNumbers(password) {
    return (/^(?=.*[a-zA-Z])(?=.*[0-9])/.test(password));
}

function hasSpecialChar(password) {
    const specialChars = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
    return specialChars.test(password);
}
  

function getPasswordStength(password) {
    //has upper and lower
    if(hasLowerCase(password) && hasUpperCase(password)) {
        
        $( ".hasUpperAndLower" ).removeClass("text-danger")
        $( ".hasUpperAndLower" ).addClass("text-success")
    } else {
        $( ".hasUpperAndLower" ).addClass("text-danger")
    }
    //has 12 characters
    if (hasTwelveChar(password)) {
        $( ".has12Char" ).removeClass("text-danger")
        $( ".has12Char" ).addClass("text-success")  
    } else {
        $( ".has12Char" ).addClass("text-danger")
    }

    //has numbers annd letters
    if (hasLettersAndNumbers(password)) {
        $( ".hasLetterAndNumbers" ).removeClass("text-danger")
        $( ".hasLetterAndNumbers" ).addClass("text-success")  
    } else {
        $( ".hasLetterAndNumbers" ).addClass("text-danger")
    }

    //has special characters
    if (hasSpecialChar(password)) {
        $( ".hasSpecialChar" ).removeClass("text-danger")
        $( ".hasSpecialChar" ).addClass("text-success") 
    } else {
        $( ".hasSpecialChar" ).addClass("text-danger")
    }
}

function getPasswordStatus(password) {
    var totalPoints = 0
    if(hasLowerCase(password) && hasUpperCase(password)) {
        totalPoints = totalPoints + 1
    }

    if(hasSpecialChar(password)) {
        totalPoints = totalPoints + 1
    }

    if(hasLettersAndNumbers(password)) {
        totalPoints = totalPoints + 1
    }

    if(hasTwelveChar(password)) {
        totalPoints = totalPoints + 1
    }
    return totalPoints;
}

function removeTextClasses() {
    $(".password-strength-status-text").removeClass("text-success")
    $(".password-strength-status-text").removeClass("text-warning")
    $(".password-strength-status-text").removeClass("text-danger")
}

function changePasswordStatusText(passwordStrength) {
    if (passwordStrength == 0) {
        $( ".password-strength-status-text" ).text("POOR");
        $(".password-strength-status-text").addClass("text-danger")
    } else if (passwordStrength == 1) {
        $( ".password-strength-status-text" ).text("POOR");
        $(".password-strength-status-text").addClass("text-danger")
    } else if (passwordStrength == 2) {
        $( ".password-strength-status-text" ).text("OKAY");
        $(".password-strength-status-text").addClass("text-warning")
    } else if (passwordStrength == 3) {
        $( ".password-strength-status-text" ).text("OKAY");
        $(".password-strength-status-text").addClass("text-warning")
    } else if (passwordStrength == 4) {
        $( ".password-strength-status-text" ).text("GREAT!!!");
        $(".password-strength-status-text").addClass("text-success")
    }

}

function changePasswordStatusBar() {
    
}


