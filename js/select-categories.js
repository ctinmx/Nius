$(document).ready(function(){
	$(".menuRot").on("click",function(){
		console.log("click")
		if($(this).hasClass("selected")){
			$(this).removeClass("selected")
		}
		else{
			$(this).addClass("selected")
		}
	})
})
