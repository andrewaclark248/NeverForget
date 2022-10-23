$(document).ready(function(){

    $("svg").text("some data")

    var circle = new ProgressBar.Circle('#someContainer', {
        color: '#FCB03C',
        strokeWidth: 3,
        duration: 2100,
        text: {
            color: "#000000",
            value: 'Text'
        }
    });


    circle.animate(1.0);


});

