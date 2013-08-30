var startx;
var starty;
var endx;
var endy;
var cont=0;
var imagenes=["img/placeholdslides1.gif","img/placeholdslides2.gif","img/placeholdslides3.gif","img/placeholdslides4.gif","img/placeholdslides5.gif"]
/*
$("#Cuerpo").click(function(e) {
    alert(e.pageX);
});*/

$(document).ready(function () {
  startup();

function startup(){
  console.warn("Waka");
  var c = document.getElementById("Cuerpo");
  c.addEventListener("touchstart", handleStart, false);
}
function handleStart(evt) {
  evt.preventDefault();
  var el = $("#Cuerpo");
  console.warn("Waka");
}
  });
