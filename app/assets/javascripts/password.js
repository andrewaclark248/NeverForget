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


});