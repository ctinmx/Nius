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


/* check */

/*var myFeeds = new Array()

$(document).ready(function () {
	setTimeout(showmasonry,3000);
});

function showmasonry(){
	$container.imagesLoaded(function(){
		$container.masonry({
			itemSelector : "li",
			columnWidth: 10    
		});
	});
}*/