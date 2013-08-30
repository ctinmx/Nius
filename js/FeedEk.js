/*
* FeedEk jQuery RSS/ATOM Feed Plugin v1.1.2
* http://jquery-plugins.net/FeedEk/FeedEk.html
* Author : Engin KIZIL 
* http://www.enginkizil.com
*/

var milagro=[];
var milagro2=0;
var imagenes=[];
var contadorfuera=0;
(function (e) { e.fn.FeedEk = function (t) { 
	var n = { 
		FeedUrl: "http://rss.cnn.com/rss/edition.rss", 
		MaxCount: 5, 
		ShowDesc: true, 
		ShowPubDate: true, 
		CharacterLimit: 0, 
		TitleLinkTarget: "_blank" 
	};

	if (t){ 
		e.extend(n, t) 
	} 

	var r = e(this).attr("id"); 
	var i; e("#" + r).empty().append('<div style="padding:3px;"><img src="loader.gif" /></div>'); 
	e.ajax({
		url: "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=" + n.MaxCount + "&output=json&q=" + encodeURIComponent(n.FeedUrl) + "&hl=en&callback=?", 
		dataType: "json",
		success: function (t) {

			console.log(t);

			e("#" + r).empty(); 
			var s = ""; 
			var cont = 0;
			var myFeeds = []
			var cont = 0;
			var imagenes=[];
			e.each(t.responseData.feed.entries, function (e, t) {
				s += '<li><div class="itemTitle"><a class="modal" href="' + t.link + '" id="'+n.Elemfeed+cont+'-titulo">' + t.title + "</a></div>"; 

				
				myFeeds[cont] = {}
				myFeeds[cont]["link"] = t.link;
				myFeeds[cont]["title"] = t.title;
				//myFeeds[cont]["image"] = "";

				var param1 = t.title;         
				f(param1);
				s += "<div id='"+contadorfuera+"-img'></div>";

				
				if (n.ShowPubDate) {

					i = new Date(t.publishedDate);
					myFeeds[cont]["date"] = i
					s += '<div class="itemDate">' + i.toLocaleDateString() + "</div>"

				} 
				if (n.ShowDesc) { 
				if (n.DescCharacterLimit > 0 && t.content.length > n.DescCharacterLimit) { 
						s += '<div class="itemContent">' + t.content.substr(0, n.DescCharacterLimit) + "...</div>"
						myFeeds[cont]["content"] = t.content.substr(0,n.DescCharacterLimit)
					}
					else { 
						s += '<div class="itemContent">' + t.content + "</div>" 
						myFeeds[cont]["content"] = t.content
					} 
				}
				var id="#"+n.Elemfeed+cont+"-img"
				cont++;
				contadorfuera++;
			});
$("#divRss1").append(s)	
get_img;
}
})
}
})
(jQuery)





function f(datos) {
	var asdf=1;
	$.ajax({
		type: "GET",
		crossDomain: true,
		async:false,
		dataType: 'jsonp',
		url:'https://ajax.googleapis.com/ajax/services/search/images',
		data: "v=1.0&q="+datos,
		success: function(datos){
			contador=0;
			img=datos.responseData.results[0].url.toString();
			if(img.toLowerCase().indexOf("?") <= 0 && img.toLowerCase().indexOf("%") <= 0){
				set_img(datos.responseData.results[0].url);
				console.log("#"+contadorfuera+"-img")
				$("#imagenes").append( "<img src='"+datos.responseData.results[0].url+"' />");

			}
			else{
				set_img("http://olea.org/~david/basur.net/teatro/nius-letras.jpg");
				$("#imagenes").append( "<img src='http://olea.org/~david/basur.net/teatro/nius-letras.jpg' />");

			}
			//set_img(datos.responseData.results[0].url);
		}
	});

}
function set_img(dato){
	milagro.append=dato;
}
function get_img(){
}
