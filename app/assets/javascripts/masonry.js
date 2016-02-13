$(function(){
    $.ajax({
        url: "api/projects/",
        type: "GET",
        data: {page : 1},
        dataType: "json",
        success: function(data) {
            console.log(data);
            set_projects(data);
        },
        error: function(data) {
            alert("errror");
            // TODO: エラー時の処理
        }
    });
});

function set_projects(projects){
    var insert = [];
    $.each(projects, function() {
        insert.push(getItemElement(this));
    });
    var $insert = $(insert);
    $('#grid').append($insert).masonry('appended', $insert);

    $('#grid').masonry({
        itemSelector: '.grid-item',
        gutterWidth: 5,
        isAnimated: true,
        animationOptions: {
            duration: 500,
            easing: 'swing'
        }
    });

    $('.grid-item').hide();
    return $('.grid-item').each(function(i) {
        return $(this).delay(i * 100).fadeIn(1000);
    });
}

// 本当はRailsにHTML生成は任せたいけど、js to railsでいい感じにデータ渡す方法がわからなかった
// もしくはデータバインディングできるjsフレームワーク
function getItemElement(project) {
    var elem = document.createElement("div");
    elem.className = "grid-item";

    var title = document.createElement("h2");
    title.innerHTML = project["title"];
    elem.appendChild(title)

    var desc = document.createElement("p")
    desc.innerHTML = project["description"];
    elem.appendChild(desc)

    //if(this["url"] != "") {
    //    var url = $('<a>').attr(this["url"]);
    //    insert.append(url);
    //}
    return elem;
}

//$(function () {
//    return $('#grid').masonry({
//        itemSelector: '.grid-item',
//        gutterWidth: 5,
//        isAnimated: true,
//        animationOptions: {
//            duration: 500,
//            easing: 'swing'
//        }
//    });
//});
//$(function() {
//    $('.grid-item').hide();
//    return $('.grid-item').each(function(i) {
//        return $(this).delay(i * 100).fadeIn(1000);
//    });
//});
