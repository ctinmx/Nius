var myFeeds = new Array()

$(document).ready(function () {
    $('#divRss2').FeedEk({
        FeedUrl: 'http://www.abc.es/rss/feeds/abc_Ciencia_Tecnologia.xml',
        MaxCount: 6,
        ShowDesc: true,
        DescCharacterLimit:200,
        Elemfeed:1
    });
    $('#divRss3').FeedEk({
        FeedUrl: 'http://www.nasa.gov/rss/image_of_the_day.rssl',
        MaxCount: 3,
        ShowDesc: true,
        DescCharacterLimit:200,
        Elemfeed:2
    });

    $('#divRss4').FeedEk({
        FeedUrl: 'http://es.gizmodo.com/rss',
        MaxCount: 6,
        ShowDesc: true,
        DescCharacterLimit:200,
        Elemfeed:3
    });
    setTimeout(showmasonry,3000);
});

function showmasonry(){
    $("#divRss1").removeClass("hide")
    $(".imagen-load").addClass("hide")
    var $container = $('#divRss1');

    $container.imagesLoaded(function(){
        $container.masonry({
            itemSelector : "li",
            columnWidth: 10    
        });
    });
}