$(document).ready(function(){
    $("#payment_plan").on('change', function() {
        var selectedPlan = this.value 
        var updatedValue = null;

        if (selectedPlan == "Bronze") {
            updatedValue = "$0.00/Month"
        } else if (selectedPlan == "Silver") {
            updatedValue = "$5.00/Month"
        } else if (selectedPlan == "Platnium") {
            updatedValue = "$8.00/Month"
        } else if (selectedPlan == "Gold") {
            updatedValue = "$12.00/Month"
        } else if (selectedPlan == "Adamantium") {
            updatedValue = "$16.00/Month"
        } else {
            updatedValue = "Error: Try refreshing the page!"
        }
        $("#upgraded-plan").text(updatedValue);

    });
});

