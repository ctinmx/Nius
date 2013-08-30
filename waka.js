
    /*
    *  How to use the Feed Control to grab, parse and display feeds.
    */
    
    google.load("feeds", "1");
    
    function OnLoad() {
      // Create a feed control
      var feedControl = new google.feeds.FeedControl();
    
      // Add two feeds.
      feedControl.addFeed("http://es.gizmodo.com/rss","Gizmodo");
      feedControl.addFeed("http://www.eluniversal.com.mx/rss/espectaculos.xml","El Universal - Espectáculos");
      feedControl.addFeed("http://www.eluniversal.com.mx/rss/mexico.xml","El Universal - México");
    
      // Draw it.
      feedControl.draw(document.getElementById("content"));
    }
    
    google.setOnLoadCallback(OnLoad);