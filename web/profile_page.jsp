

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

            .modal-content{
                animation-name: animatetop;
                animation-duration: 0.4s
            }

            @keyframes animatetop {
                from {
                    top: -300px;
                    opacity: 0
                }
                to {
                    top: 0;
                    opacity: 1
                }
            }

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
                        <a id="profileBtn" href="#"><span class="fa fa-user-circle mr-2"></span><%= user.getName()%></a>
                    </li>
                    <li class="p-1">
                        <a href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>


        <!--    End of Navbar-->

        <!--        Modal-->

        <div id="myModal" class="hidden fixed z-10 h-full w-full overflow-auto bg-black/40">
            <!-- Modal content -->
            <div class="modal-content rounded-lg relative mx-auto w-[30%] shadow-md  mt-5 bg-[#fefefe]">
                <div class="py-3 px-4 rounded-lg rounded-b-none bg-sky-500 ">
                    <span id="close" class=" text-white px-1 transition ease-in-out delay-150 hover:text-red-400 float-right font-bold text-2xl h-full pb-10 cursor-pointer">&times;</span>
                    <h2 class="text-white font-bold text-lg">TechBlog</h2>
                </div>
                <div class="py-3 px-4">
                    <div class="flex flex-col content-center gap-3">
                        <img src="pictures/<%= user.getProfile() %>" alt="profile" class="rounded-full w-28 h-28 mx-auto"/>
                        <h2 class=" text-lg font-bold mx-auto"><%= user.getName() %></h2>
                        <table class="table-fixed mx-auto text-center">
                            <tr class="border-b-2 h-10">
                                <th scope="row">ID :</th>
                                <td><%= user.getId() %></td>
                            </tr>
                            <tr class="border-b-2 h-10">
                                <th scope="row">Email :</th>
                                <td><%= user.getEmail() %></td>
                            </tr>
                            <tr class="border-b-2 h-10">
                                <th scope="row">Gender :</th>
                                <td><%= user.getGender() %></td>
                            </tr>
                            <tr class="border-b-2 h-10">
                                <th scope="row">Registered on :</th>
                                <td><%= user.getDateTime().toString() %></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="py-3 px-4 flex justify-end items-center">
                    <div class="flex items-center space-x-4">
                        <button id="closeBtn"  class="bg-slate-500 hover:bg-slate-600 text-white font-bold py-2 px-4 rounded">Close</button>
                        <button class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--        End of Modal-->


        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="js/app.js" type="text/javascript"></script>
        <script>
            var modal = $("#myModal");
            $("#profileBtn").click(function (e) {
                e.preventDefault();
                modal.show();
            });
            
            $("#closeBtn").click(function (e) {
                e.preventDefault();
                modal.hide();
            });

            $("#close").click(function (e) {
                e.preventDefault();
                modal.hide();
            });

            $(window).click(function (e) {
                e.preventDefault();
                if ($(e.target).is(modal)) {
                    modal.hide();
                }
            });
        </script>
    </body>
</html>
