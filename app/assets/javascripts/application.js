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



});


function getNewPassword()
{
    console.log($(".new-password"))
    //$(".new-password").val("Glenn Quagmire"); 
    var data2 = null;
    $.ajax({

        url : '/ajax/get_new_password',
        type : 'GET',
        dataType:'json',
        success : function(data) { 
            $(".new-password").text(data.password);  
            $("#password_password").val(data.password)
        },
        error : function(request,error)
        {
            alert("Request: "+JSON.stringify(request));
        }
    });
}

