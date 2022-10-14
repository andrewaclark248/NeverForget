$(document).ready(function(){

    //
    $('.active-password-table').mouseenter(function (e) {
        $(e.currentTarget).removeClass("bg-light")
        $(e.currentTarget).addClass("active-list-item")
    })
    $('.active-password-table').mouseleave(function (e) {
        $(e.currentTarget).removeClass("active-list-item")
        $(e.currentTarget).removeClass("bg-light")
    });


    $(".active-password-table").mouseenter(function(e) {
        //console.log(e.target)

    }).mouseleave(function(e) {
        //$(e.target).removeClass("active-list-item")
        //$(e.target).addClass("bg-light")
    });

});