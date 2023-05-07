
console.log("file laoded haha")





$(document).ready(function(){



        //
        $(".expandNavbar").hover(function(e){



            let tagName = e.target?.tagName;
            let parentTagName = e.target?.parentElement.tagName;
            console.log("tagName", tagName)
            console.log("parentTagName", parentTagName == "A")
            if (tagName == "li" || tagName == "LI") {
                $(e.target).addClass("expandNavbarHover");
            } else if ( parentTagName == "li" || parentTagName == "LI" ) {
                $(e.target.parentElement).addClass("expandNavbarHover");
            } else if (parentTagName == "A" || parentTagName == "a") {
                $(e.target.parentElement).addClass("expandNavbarHover");
            }


            }, function(e){
                let tagName = e.target?.tagName;
                let parentTagName = e.target?.parentElement.tagName;

                if (tagName == "li" || tagName ==  "LI") {
                    $(e.target).removeClass("expandNavbarHover");
                } else if ( parentTagName == "li" || parentTagName == "LI" ) {
                    $(e.target.parentElement).removeClass("expandNavbarHover");
                }else if (parentTagName == "A" || parentTagName == "a") {
                    $(e.target.parentElement).removeClass("expandNavbarHover");
                }

            });


    
    //change width of navbar
    $("#expandNavbar").click(function(){

        let isSmallNavbar = $(".sidenav").hasClass("navBarSmall")

        if (isSmallNavbar) {
            //change icon
            $(".navbarBackIconRight").addClass("hideNavbarIcon")
            $(".navbarBackIconLeft").removeClass("hideNavbarIcon")

            //change navbar width
            $(".sidenav").removeClass("navBarSmall");
            $(".sidenav").addClass("navBarLarge");

        } else {

            $(".navbarBackIconLeft").addClass("hideNavbarIcon")
            $(".navbarBackIconRight").removeClass("hideNavbarIcon")
            $(".sidenav").removeClass("navBarLarge");
            $(".sidenav").addClass("navBarSmall");

        }

    });


    const sidenav = document.querySelector('.sidenav');


    const resizeObserver = new ResizeObserver((entries) => {
        let navBarWidth = $(".sidenav").width()
        
        if (navBarWidth == 160) {
            console.log("widht is 160")
            $(".navbarText").removeClass("hideNavBarText")
        } else if (navBarWidth <= 160) {
            $(".navbarText").addClass("hideNavBarText")
        }


      });
      
      resizeObserver.observe(sidenav);

  });

