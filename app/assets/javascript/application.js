$(document).ready(function(){

	var input = "<div class='form-group col-12 input-copy'><label>Url</label><input class='form-control'></input></div>"

	$(".add-url").click(function(){
		$( ".user-password-form" ).append(input);
	});
	$(".remove-url").click(function(){
		//$(".input-copy").last().forEach(myFunction);
		$(".input-copy").last().remove();
		//var inputLength = $(".input-copy").length
		//for (let i = 0; i < inputLength; i++) {
		//}
		//console.log($(".input-copy")[0].remove());
	});

});

