function getPosts(catId, temp) {
    $("#post-container").hide();
    $("#loader").show();
    $(".c-link").removeClass("primary-background text-white");
    $.ajax({
        url: "load_post.jsp",
        data: {cid: catId},
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            $("#loader").hide();
            $("#post-container").show();
            $("#post-container").html(data);
            $(temp).addClass("primary-background text-white");
        }
    });
}

$(document).ready(function (e) {
    let allPostRefrence = $(".c-link")[0];
    getPosts(0, allPostRefrence);
});

