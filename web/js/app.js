function doLike(postId, userId) {
    console.log(postId + "," + userId);
    var isLiked = false;
    $.ajax({
        url: "LikeServlet",
        data: {
            postId: postId,
            userId: userId,
            operation: "liked"
        },
        success: function (data, textStatus, jqXHR) {
            console.log("isLiked : " + data);
            if (data.trim() === 'true')
                isLiked = true;
            else
                isLiked = false;
            let operation = isLiked ? "dislike" : "like";
            const d = {
                postId: postId,
                userId: userId,
                operation: operation
            };

            $.ajax({
                url: "LikeServlet",
                data: d,
                success: function (data, textStatus, jqXHR) {
                    console.log("like/dislike : " + data);
                    if (data.trim() === 'true') {
                        let count = $("#" + postId + "span").html();
                        console.log(count);
                        if (isLiked)
                            count--;
                        else
                            count++;
                        $("#" + postId + "span").html(count);
                        var likeBtn = $("#" + postId + "btn");
                        if (isLiked) {
                            likeBtn.removeClass("bg-sky-500 text-white");
                            likeBtn.addClass(" text-sky-500 bg-white");
                        } else {
                            likeBtn.removeClass("text-sky-500 bg-white");
                            likeBtn.addClass("bg-sky-500 text-white");
                        }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(data);
                }
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });

}