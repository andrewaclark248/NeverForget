
console.log("file laoded haha")





$(document).ready(function(){

    //on hover change color 
    $(".navbarBackIconRight").hover(function(){
        $(".navbarBackIconRight").attr("fill","white");
        }, function(){
            $(".navbarBackIconRight").attr("fill","#C0C0C0");
        });

    $(".navbarBackIconLeft").hover(function(){
        $(".navbarBackIconLeft").attr("fill","white");
        }, function(){
            $(".navbarBackIconLeft").attr("fill","#C0C0C0");
        });


    
    //on change
    $("#expandNavbar").click(function(){

        let isSmallNavbar = $(".sidenav").hasClass("navBarSmall")

        if (isSmallNavbar) {
            $(".navbarBackIconRight").addClass("hideNavbarIcon")
            $(".navbarBackIconLeft").removeClass("hideNavbarIcon")
            $(".sidenav").removeClass("navBarSmall");
            $(".sidenav").addClass("navBarLarge");

        } else {

            $(".navbarBackIconLeft").addClass("hideNavbarIcon")
            $(".navbarBackIconRight").removeClass("hideNavbarIcon")
            $(".sidenav").removeClass("navBarLarge");
            $(".sidenav").addClass("navBarSmall");
        }

    });

  });