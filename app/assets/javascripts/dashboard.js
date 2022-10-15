$(document).ready(function(){

    $(".progress").each(function() {

        var value = $(this).attr('data-value');
        var left = $(this).find('.progress-left .progress-bar');
        var right = $(this).find('.progress-right .progress-bar');

        if (100 > 0) {
        if (value <= 50) {
            right.css('transform', 'rotate(' + percentageToDegrees(80) + 'deg)')
        } else {
            right.css('transform', 'rotate(180deg)')
            left.css('transform', 'rotate(' + percentageToDegrees(80 - 50) + 'deg)')
        }
        }
    })

})

function percentageToDegrees(percentage) {

    return percentage / 100 * 360

}