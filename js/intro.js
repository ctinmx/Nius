var cont = 0;	
var maxItem = 3
$(document).ready(function(){
	var element = $('#carrusel');

	var swipeleft = Hammer(element).on("swipeleft", function(event) {
		cont++;
		if(cont<maxItem ) {
			$(".c1").removeClass("img"+cont)
			$(".c1").addClass("img"+(cont+1))
			$("#b"+(cont)).removeClass("active");
			$("#b"+(cont+1)).addClass("active")
		}
		else{
			cont = maxItem - 1;
		}
	});

	var swiperight = Hammer(element).on("swiperight", function(){
		if(cont >0){
			cont--
			$(".c1").removeClass("img"+(cont+2))
			$(".c1").addClass("img"+(cont+1))

			$("#b"+(cont+2)).removeClass("active")
			$("#b"+(cont+1)).addClass("active")
		}
	})
})