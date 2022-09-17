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
            alert("Request: "+JSON.stringify(request));
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
            alert("Request: "+JSON.stringify(request));
        }
    });
}