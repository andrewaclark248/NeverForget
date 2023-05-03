$(document).ready(function(){
    $(".keyValueDropdown li a").click(function(e){
        let text = e.target.textContent;
        $(".keyValueDropdownLabel").text(text)
        if (text == "Custom Name") {
            $("#key_key").val("")
            $(".key-input-field").removeClass("d-none")
        } else {
            $("#key_key").val(text)
            let result = $(".key-input-field").hasClass("d-none")
            if (!result) {
                $(".key-input-field").addClass("d-none")
            }
        }

    });
})