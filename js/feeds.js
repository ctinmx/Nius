var stringHtml='';
var resultado;
$.ajax({
    url: 'https://nius-rainsoft.rhcloud.com/index.php/api/index/1',
    type: 'POST',
    dataType: 'json',
    success: function (res){
        resultado = res;
        var s = construir(resultado);
    }
})

function construir(resultado){
    resultado = JSON.stringify(resultado);
    var jsonUsuario = JSON.parse(resultado);

    var arregloFeeds = jsonUsuario.rss; 
    var arregloImages = jsonUsuario.images;

    stringHtml = '<ul id ="feedsMiniatura" class="feedEkList">';

    for (var i =0 ; i<arregloFeeds.length;i++) {
        var rssActual = arregloFeeds[i];
        stringHtml += "<li id='article" + rssActual.id + "'class='item-news' data-category='"+ rssActual.categoria_id + "' data-title='" + rssActual.title + "' data-content='" + rssActual.description + "' data-link='"+ rssActual.link + "'>"
        stringHtml += "<div class='article-bar'></div>"
        for (var j=0; j<arregloImages.length;j++){
            if (arregloImages[j].id_rss == rssActual.id) {
                stringHtml+= '<a class="modal-link" href="#" data-id="'+rssActual.id+'">'
                stringHtml+= '<img src="'+(arregloImages[j].imagen_url)+'" width=200>'
                stringHtml+= '</a>'
            }
        }
        stringHtml += '<div class="itemTitle"><a class="modal-link" href="#" data-id="'+rssActual.id+'"><h4>' + rssActual.title + "</h4></a></div>";
        stringHtml += '</li>'
    }
    
    stringHtml += '</ul>'

    var nodohtml = $(stringHtml)

    $('#miniaturas').append(nodohtml);

    $(".modal-link").click(function(event){
        event.preventDefault()
        var articulo = $("#article" + $(this).attr("data-id"))
        $('#modal-container').removeClass("hide")
        $("#modal-news .modal-body").html("<p>" + articulo.attr("data-content") + "</p>")
        $("#modal-news .modal-header").html("<h4>" + articulo.attr("data-title") + "</h4>")
        $("#modal-news .modal-footer").html('<hr><a href="'+ articulo.attr("data-link") + '">Ir al articulo en internet</a>')
    })

    $(".close").click(function(){
        $('#modal-container').addClass("hide")
    })

    return stringHtml;
}

function disableOther( button ) {
    if( button !== 'showLeftPush' ) {
        $("#showLeftPush").toggleClass('disabled' );
    }
}

function menutoggle(){
    $(this).toggleClass('active');
    $("body").toggleClass('cbp-spmenu-push-toright' );
    $("#cbp-spmenu-s1").toggleClass('cbp-spmenu-open' );
    disableOther( 'showLeftPush' );
}

$(document).ready(function(){

    var menuLeft = $('#cbp-spmenu-s1')

    $('#showLeftPush').on("click", menutoggle)

    var $container = $('#feedsMiniatura');

    $container.masonry({
        itemSelector : ".item-news",
        columnWidth: 10
    });

    $(".category-link").on("click",function(event){
        event.preventDefault()
        var numCategorias = 6
        var categoriaActual = $(this).attr("data-category")
        var i;

        if(categoriaActual != "all"){
            for(i=1;i<=numCategorias ;i++){
                if(i != categoriaActual){
                    $(".item-news[data-category='" + i + "'] ").addClass("hide")
                }
                else{
                    $(".item-news[data-category='" + i + "'] ").removeClass("hide")
                }
            }
            menutoggle() 
        }
        else{
            $(".item-news").removeClass("hide")
            menutoggle()    
        }

        $("#titulo-feed").html( $(".category-link[data-category='" + categoriaActual + "']").html())
    })
})


