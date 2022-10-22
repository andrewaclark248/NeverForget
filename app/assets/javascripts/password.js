$(document).ready(function(){

    //
    $('.active-password-table').mouseenter(function (e) {
        $(e.currentTarget).removeClass("bg-light")
        $(e.currentTarget).addClass("active-tab")
    })
    $('.active-password-table').mouseleave(function (e) {
        $(e.currentTarget).removeClass("active-tab")
        $(e.currentTarget).addClass("bg-light")
    });


    $(".active-password-table").mouseenter(function(e) {
        //console.log(e.target)

    }).mouseleave(function(e) {
        //$(e.target).removeClass("active-list-item")
        //$(e.target).addClass("bg-light")
    });


    $(".accordion-button").click(function(e){
        $(".accordion-button").removeClass("bg-danger")
        $(".accordion-button").addClass("bg-secondary")
        $(e.currentTarget).removeClass("bg-secondary")
        $(e.currentTarget).addClass("bg-danger")
    })

    $(".copyIcon").click(function(e){
        navigator.clipboard.writeText($('#password_password').val());
    })
    var clipboard = new ClipboardJS('.copyIcon');

    clipboard.on('success', function (e) {
        let trigger_button = e.trigger;
        // update the tooltip title, get the tooltip instance, and show it
        trigger_button.setAttribute('data-bs-original-title', 'Copied!');
        let btn_tooltip = bootstrap.Tooltip.getInstance(trigger_button);
        btn_tooltip.show();
        // reset the tooltip title
        trigger_button.setAttribute('data-bs-original-title', 'Copy to clipboard');
    });

    /**$('.copyPasswordBtn').click(function(e){
        console.log("wemnt heehhhe")
        $(".copyIcon").tooltip().attr('data-original-title', "new title");

       // $(".copyIcon").attr('title', "Copied!").tooltip('fixTitle').tooltip('show');;
       // $(".copyIcon").attr('data-bs-original-title', "Copied!");

        
        //var copyInternval = setInterval(function(){
        //    $('.copyPasswordBtn').blur();
        //},50)
        //copyInternval();
        //clearInterval(copyInternval);
      });**/



    //PASSWORD ANALYZER----------------------
    //on page load hide analyzer
    $( ".password-strength-analyzer" ).hide();
    //on page load set hidden field
    setStrengthHiddenField($('#password_password').val())


    $('#password_password').blur(function(e) {
        //hide password strength box on blur
        $( ".password-strength-analyzer" ).hide();

        var password = e.currentTarget.value
        //show password analyzer

        //update password status text
        removeTextClasses();
        var passwordStrength = getPasswordStatus(password);
        changePasswordStatusText(passwordStrength)

        //show password status text
        $( ".password-strength-text" ).show();
     });

    $('#password_password').on('input',function(e){
        $( ".password-strength-text" ).hide();

        //show password strength box on change
        $( ".password-strength-analyzer" ).show();
        var password = e.target.value;
        getPasswordStength(password)
        setStrengthHiddenField(password)
    });
    //PASSWORD ANALYZER----------------------
    $(".eyeIconCursor").on('click',function() {
        if ($("#password_password").attr('type') === 'password') {
            $(".eyeIconCursor").removeClass("fa-eye")
            $(".eyeIconCursor").addClass("fa-eye-slash")
            $("#password_password").attr('type', 'text');
        } else {
            $(".eyeIconCursor").removeClass("fa-eye-slash")
            $(".eyeIconCursor").addClass("fa-eye")
            $("#password_password").attr('type', 'password');
        }
    });

    /****
    $(".eyeIconCursor").on({
        mouseenter: function () {
            $(".eyeIconCursor").removeClass("text-secondary")
            $(".eyeIconCursor").addClass("text-dark")
        },
        mouseleave: function () {
            $(".eyeIconCursor").removeClass("text-dark")
            $(".eyeIconCursor").addClass("text-secondary")
        }
    }); */

});