$(document).ready(function(){
	setTimeout(showMenu,1000);
})

function showMenu(){
	var firsttime = true; //aqui se pregunta en la db
	if(firsttime){
		self.location="intro.html";
	}
	else{
		self.location="home.html"
	}
}