<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helpers.Helper"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
    <%

        LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        User user = (User) session.getAttribute("currentUser");
        int catId = Integer.parseInt(request.getParameter("cid"));
        //likeDao.dislikePost(1, 6);
        List<Post> posts;
        if (catId == 0) {
            posts = postDao.getAllPosts();
        } else {
            posts = postDao.getPostsByCategory(catId);
        }

        if (posts.size() == 0) {
            out.println("<h2 class='text-center text-3xl'>No posts in this category</h2>");
            return;
        }

        for (Post post : posts) {
            String date = post.getDate().toString();
            date = date.substring(0, date.indexOf(" "));
            date = Helper.formatDate(date);
            boolean isLiked = likeDao.isLikedBy(user.getId(), post.getId());
    %>
    <div
        class="relative flex max-w-[24rem] h-96 flex-col  rounded-xl bg-white bg-clip-border text-gray-700 shadow-md">
        <div class="relative m-0  h-40 object-cover  text-gray-700 bg-transparent rounded-none shadow-none bg-clip-border">
            <img
                src="blog_images/<%=post.getImage()%>"
                alt="ui/ux review check" class="object-cover h-40 w-full rounded-t-xl" />
        </div>
        <div class="p-6 max-h-[50%]">
            <h4 class="block font-sans text-xl antialiased font-semibold leading-snug tracking-normal text-blue-gray-900">
                <%= post.getTitle()%>
            </h4>
            <p class="block mt-3 font-sans text-sm antialiased font-normal leading-relaxed text-gray-700">
                <%= post.getContent()%>
            </p>
            <!--            <p class="block mt-3 font-sans text-sm antialiased font-normal leading-relaxed text-gray-700">
            <%= post.getCode()%>
        </p>-->
        </div>
        <div class=" h-[100%]">
            <div class="absolute bottom-0 m-3">
                <a href="show_blog_page.jsp?post_id=<%= post.getId()%>"
                   class="align-middle select-none font-sans font-bold text-center transition-all disabled:opacity-50 text-xs py-2 px-2 rounded-lg hover:bg-sky-500 text-sky-500 border border-sky-500 hover:text-white active:bg-gray-900/2 mr-2">
                    Read More
                </a>
                <button
                    id="<%= post.getId()%>btn"
                    class="align-middle select-none font-sans font-bold text-center transition-all disabled:opacity-50 text-xs py-2 px-2 rounded-lg
                    <%
                        if (isLiked) {
                    %>
                    bg-sky-500 text-white
                    <% } else {
                    %>

                    text-sky-500 bg-white
                    <% }%>
                    border border-sky-500"
                    type="button" onclick="doLike(<%= post.getId()%>,<%= user.getId()%>)">
                    <i class="fa fa-thumbs-o-up"></i>
                    <span id="<%= post.getId()%>span"><%= likeDao.countLikeOnPost(post.getId())%></span>
                </button>
                <button
                    class="align-middle select-none font-sans font-bold text-center transition-all disabled:opacity-50 text-xs py-2 px-2 rounded-lg hover:bg-sky-500 text-sky-500 border border-sky-500  bg-white hover:text-white active:bg-gray-900/2"
                    type="button">
                    <i class="fa fa-commenting-o"></i>
                    <span>4</span>
                </button>
            </div>
        </div>
    </div>
    <% }%>
</div>