$(document).ready(function(){

    /***
    $("#mfaPhone").click(function(e){
        $("#mfaPhone").removeClass("d-none")

        if (!$("#mfaEmail").hasClass("d-none")) {
            $("#mfaEmail").addClass("d-none");
        }
    })

    $("#mfaEmail").click(function(e){
        $("#mfaEmail").removeClass("d-none")

        if (!$("#mfaPhone").hasClass("d-none")) {
            $("#mfaPhone").addClass("d-none");
        }
    }) */

    $('#mfaEnabled').change(function() {
        $(".mfaSendMethod").removeClass("d-none")
    });
    
    $('#mfaDisabled').change(function() {
        $(".mfaSendMethod").addClass("d-none")
    });

    $('#mfaEmail').change(function() {
        $(".mfaEmail").removeClass("d-none")
        $(".mfaPhone").addClass("d-none")
    });
    
    $('#mfaPhone').change(function() {
        $(".mfaPhone").removeClass("d-none")
        $(".mfaEmail").addClass("d-none")
    });


    //phone format
    $('#bronze_mfa_phone').mask('(999)-999-9999'); 
    $('#silver_mfa_phone').mask('(999)-999-9999'); 
    $('#gold_mfa_phone').mask('(999)-999-9999'); 


});