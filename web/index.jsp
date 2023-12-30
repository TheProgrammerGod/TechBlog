
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 83%, 73% 100%, 33% 83%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <!--        Navbar-->
        <%@include file="navbar.jsp" %>

        <!--        Banner-->
        <div class="banner text-white bg-sky-500 w-full h-64">
            <div class="h-full w-1/2 mx-auto py-6">
                <h3 class="text-4xl">Welcome to TechBlog</h3>
                <p class="text-sm mb-1 mt-3">A programming language is usually described in terms of its syntax (form) and semantics (meaning). These are usually defined by a formal language.</p>
                <p class="text-sm mb-2">Programming language theory is the subfield of computer science that studies the design, implementation, analysis, characterization, and classification of programming languages.</p>
                <a href="register_page.jsp" class="text-sm rounded-md py-1 px-1.5 mr-2 bg-none text-white border  border-white hover:text-sky-500 hover:bg-white font-bold">Get Started</a>
                <a href="login_page.jsp" class="text-sm rounded-md py-1 px-1.5 bg-none text-white border border-white hover:text-sky-500 hover:bg-white font-bold">Login</a>
            </div>

        </div>

        <!--        Cards-->
        <div class="container mx-auto px-4 py-8">
            <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <%
                    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
                    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                    List<Post> posts = postDao.getAllPosts();
                    for (Post post : posts) {
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
                            <a href="login_page.jsp"
                               class="align-middle select-none font-sans font-bold text-center transition-all disabled:opacity-50 text-xs py-2 px-2 rounded-lg hover:bg-sky-500 text-sky-500 border border-sky-500 hover:text-white active:bg-gray-900/2 mr-2">
                                Read More
                            </a>
                            <a href="login_page.jsp"
                                id="<%= post.getId()%>btn"
                                class="align-middle select-none font-sans font-bold text-center transition-all disabled:opacity-50 text-xs py-2 px-2 rounded-lg
                               
                                hover:bg-sky-500 hover:text-white
                                text-sky-500 bg-white
                                border border-sky-500"
                                type="button">
                                <i class="fa fa-thumbs-o-up"></i>
                                <span id="<%= post.getId()%>span"><%= likeDao.countLikeOnPost(post.getId())%></span>
                            </a>
                            <a href="login_page.jsp"
                                class="align-middle select-none font-sans font-bold text-center transition-all disabled:opacity-50 text-xs py-2 px-2 rounded-lg hover:bg-sky-500 text-sky-500 border border-sky-500  bg-white hover:text-white active:bg-gray-900/2"
                                type="button">
                                <i class="fa fa-commenting-o"></i>
                                <span>4</span>
                            </a>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="js/app.js" type="text/javascript"></script>
    </body>
</html>
