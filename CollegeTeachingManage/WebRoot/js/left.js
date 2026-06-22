function toggleBox(obj){
    var next = obj.nextElementSibling;
    if(next.style.display=="block"){
        next.style.display="none";
    }else{
        next.style.display="block";
    }
}

$(function(){
    var href = window.location.href;
    if(href.indexOf("scoreStat") > -1){
        $(".small a[href*='scoreStat']").parent().addClass("hightLight");
        $(".small a[href*='scoreStat']").parents(".box").css("display","block");
    }
});