

<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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

        <nav class="bg-sky-500 w-full text-white">
            <div class="max-w-screen-xl px-4 py-3 mx-auto flex justify-between h-14">
                <div class="flex items-center">
                    <a href="index.jsp" class="mr-5 font-medium"><span class="fa fa-bookmark mr-2"></span>TechBlog</a>
                    <ul class="flex font-medium space-x-8 justify-start">
                        <li class="p-1">
                            <a href="#">Learn</a>
                        </li>
                        <li class="p-1">
                            <a href="#">Categories</a>
                        </li>
                        <li class="p-1">
                            <a href="#">Contact</a>
                        </li>

                    </ul>
                </div>
                <!--                <form class="justify-self-end">
                                    <input type="search"
                                           class="text-black rounded py-1 px-2 border-0 border-none outline-0"
                                           placeholder="Search">
                                    <button type="Submit"class="py-1 px-2 bg-sky-700 rounded"><span class="fa fa-search"></span></button>
                                </form>-->
                <ul class="flex font-medium space-x-2 justify-self-end justify-start">
                    <li class="p-1">
                        <a href="profile_page.jsp"><span class="fa fa-user-circle mr-2"></span><%= user.getName() %></a>
                    </li>
                    <li class="p-1">
                        <a href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>


        <!--    End of Navbar-->


        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="js/app.js" type="text/javascript"></script>
    </body>
</html>
