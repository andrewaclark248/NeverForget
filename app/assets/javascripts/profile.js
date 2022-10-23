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



    $(".sendTestEmail").click(function(e){
        $(".bronze_email").val()
        var email = null
        if ($("#bronze_email").val() != undefined) {
            email = $("#bronze_email").val() 
        } else if ($("#platnium_email").val() != undefined) {
            email = $("#platnium_email").val() 
        }
        sendTestEmail(email)

    })


    //eyeIconCursorProfile

    $(".eyeIconCursorProfile").on('click',function() {
        if ($("[id$='password']").attr('type') === 'password') {
            $(".eyeIconCursorProfile").removeClass("fa-eye")
            $(".eyeIconCursorProfile").addClass("fa-eye-slash")
            $("[id$='password']").attr('type', 'text');
        } else {
            $(".eyeIconCursorProfile").removeClass("fa-eye-slash")
            $(".eyeIconCursorProfile").addClass("fa-eye")
            $("[id$='password']").attr('type', 'password');
        }
    });
    $("[id$='confirm_password']")

    $(".eyeIconCursorProfileConfirm").on('click',function() {
        if ($("[id$='password_confirmation']").attr('type') === 'password') {
            $(".eyeIconCursorProfileConfirm").removeClass("fa-eye")
            $(".eyeIconCursorProfileConfirm").addClass("fa-eye-slash")
            $("[id$='password_confirmation']").attr('type', 'text');
        } else {
            $(".eyeIconCursorProfileConfirm").removeClass("fa-eye-slash")
            $(".eyeIconCursorProfileConfirm").addClass("fa-eye")
            $("[id$='password_confirmation']").attr('type', 'password');
        }
    });



    
});

function sendTestEmail(email) {
    var url = '/ajax/send_test_email/'
    $.ajax({
        method: "POST",
        url: url,
        data: { email: email }
    })

}