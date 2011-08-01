$(function(){
    $("a").live("click", function(e){
        var linkUrl =  $(this).attr("href");
        var internalDomain = location.host;
        //console.log(linkUrl);
        if((linkUrl.match(/^https?/))&&(!linkUrl.match(internalDomain))){
        var evData = {
            "category" : "outerLink",
            "action" : document.URL,
            "label" : linkUrl
            }
           _gaq.push(['_trackEvent', evData.category, evData.action, evData.label]);
         }
    });
});

