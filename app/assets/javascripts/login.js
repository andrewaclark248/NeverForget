$(document).ready(function(){

    $(".eyeIconCursor").on('click',function() {
        if ($("#login_password").attr('type') === 'password') {
            $(".eyeIconCursor").removeClass("fa-eye")
            $(".eyeIconCursor").addClass("fa-eye-slash")
            $("#login_password").attr('type', 'text');
        } else {
            $(".eyeIconCursor").removeClass("fa-eye-slash")
            $(".eyeIconCursor").addClass("fa-eye")
            $("#login_password").attr('type', 'password');
        }
    });


    $(".eyeIconCursorConfirm").on('click',function() {
        if ($("#login_password_confirmation").attr('type') === 'password') {
            $(".eyeIconCursorConfirm").removeClass("fa-eye")
            $(".eyeIconCursorConfirm").addClass("fa-eye-slash")
            $("#login_password_confirmation").attr('type', 'text');
        } else {
            $(".eyeIconCursorConfirm").removeClass("fa-eye-slash")
            $(".eyeIconCursorConfirm").addClass("fa-eye")
            $("#login_password_confirmation").attr('type', 'password');
        }
    });


    

});

