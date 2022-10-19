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

    var clipboard = new ClipboardJS('.copyIcon');

    clipboard.on('success', function (e) {
        console.log("went here")
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


      


});