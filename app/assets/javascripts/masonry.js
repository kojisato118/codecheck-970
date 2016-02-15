var page = 1;

$(function(){
    setMasonry();
    reload(page);
});

function reload(page){
    $.ajax({
        url: "api/contents/",
        type: "GET",
        data: {page : page},
        dataType: "json",
        success: function(data) {
            setProjects(data);
        },
        error: function(data) {
            alert("errror");
            // TODO: エラー時の処理
        }
    });
}

function setProjects(projects){
    var insert = [];
    $.each(projects, function() {
        insert.push(getItemElement(this));
    });
    var $insert = $(insert);
    $('#grid').append($insert).masonry('appended', $insert);

    setMasonry();

    animateGridItems(page);
}

// 本当はRailsにHTML生成は任せたいけど、js to railsでいい感じにデータ渡す方法がわからなかった
// もしくはデータバインディングできるjsフレームワーク
function getItemElement(project) {
    var elem = document.createElement("div");
    elem.className = "grid-item";

    var title = document.createElement("h3");
    title.innerHTML = project["title"];
    elem.appendChild(title);

    var imageDiv = document.createElement("div");
    imageDiv.className = "img";
    var img = document.createElement("img");
    img.setAttribute("src", project["image"]);
    console.log(project["image"]);
    imageDiv.appendChild(img);
    elem.appendChild(imageDiv);

    var desc = document.createElement("div");
    desc.className = "description";
    desc.innerHTML = project["description"];
    elem.appendChild(desc);

    if(project["url"] != null) {
        var morediv = document.createElement("div");
        morediv.className = "more";

        var url = document.createElement("a");
        url.className = "button";
        url.href = project["url"];
        var text = document.createTextNode("詳細を読む");
        url.appendChild(text);

        morediv.appendChild(url);

        elem.appendChild(morediv);
    }

    return elem;
}

function setMasonry() {
    $('#grid').masonry({
        itemSelector: '.grid-item',
        gutterWidth: 0,
        isAnimated: true,
        animationOptions: {
            duration: 500,
            easing: 'swing'
        }
    });

    // APIとの組み合わせ方がよくわからなかった
    //$('#grid').infinitescroll({
    //        navSelector  : '#page-nav',    // selector for the paged navigation
    //        nextSelector : '#page-nav p',  // selector for the NEXT link (to page 2)
    //        itemSelector : '.grid-item',     // selector for all items you'll retrieve
    //        loading: {
    //            finishedMsg: 'No more pages to load.',
    //            img: 'http://i.imgur.com/6RMhx.gif'
    //        }
    //    },
    //    // trigger Masonry as a callback
    //    function( data ) {
    //        setProjects(data);
    //    }
    //);
}

function animateGridItems(page){
    $('.grid-item page' + page).hide();
    return $('.grid-item ' + page).each(function(i) {
        return $(this).delay(i * 100).fadeIn(1000);
    });
}

$(document).on('click',"#more",function(){
    page ++;
    reload(page);
});
