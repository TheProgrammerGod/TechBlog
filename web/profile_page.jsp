

<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Category> categories = postDao.getCategories();
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                        <li class="p-1 px-0">
                            <a id="postBtn" class="text-sky-500 bg-white py-1 px-2 rounded " href="#">Post</a>
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

        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {

        %>

        <div class="h-6 text-sm pt-1.5 text-center font-light pb-6 <%= msg.getCssClass()%>"role="alert">
            <%= msg.getContent()%>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>



        <!--       Profile Modal-->

        <div id="profileModal" class="hidden fixed z-10 h-full w-full overflow-auto bg-black/40">
            <!-- Modal content -->
            <div class="modal-content rounded-lg relative mx-auto w-[30%] shadow-md  mt-2 bg-[#fefefe]">
                <div class="py-3 px-4 rounded-lg rounded-b-none bg-sky-500 ">
                    <span id="profileClose" class=" text-white px-1 transition ease-in-out delay-150 hover:text-red-400 float-right font-bold text-2xl h-full pb-10 cursor-pointer">&times;</span>
                    <h2 class="text-white font-bold text-lg">TechBlog</h2>
                </div>
                <div class="py-3 px-4">
                    <div class="flex flex-col content-center gap-1">
                        <img src="pictures/<%= user.getProfile()%>" alt="profile" class="rounded-full w-28 h-28 mx-auto"/>
                        <h2 class=" text-lg font-bold mx-auto"><%= user.getName()%></h2>
                        <table id="profile-details" class="table-fixed mx-auto text-center">
                            <tr class="border-b-2 h-10">
                                <th scope="row">ID :</th>
                                <td><%= user.getId()%></td>
                            </tr>
                            <tr class="border-b-2 h-10">
                                <th scope="row">Email :</th>
                                <td><%= user.getEmail()%></td>
                            </tr>
                            <tr class="border-b-2 h-10">
                                <th scope="row">Gender :</th>
                                <td><%= user.getGender()%></td>
                            </tr>
                            <tr class="border-b-2 h-10">
                                <th scope="row">Registered on :</th>
                                <td><%= user.getDateTime().toString()%></td>
                            </tr>
                        </table>
                        <div id="edit-profile" class="hidden mx-auto">
                            <h2 class="text-xl font-bold text-center">Please Edit Carefully!</h2>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table  class="table-fixed mx-auto text-sm">
                                    <tr class="border-b-2 h-5">
                                        <td>ID :</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr class="border-b-2 h-5">
                                        <td>Name :</td>
                                        <td><input class="bg-gray-200 border p-1 rounded border-black" type="text" name="user_name" value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr class="border-b-2 h-5">
                                        <td>Email :</td>
                                        <td><input class="bg-gray-200 border p-1 rounded border-black" type="email" name="user_email" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr class="border-b-2 h-5">
                                        <td>Password :</td>
                                        <td><input class="bg-gray-200 border p-1 rounded border-black" type="password" name="user_pass" value="<%= user.getPassword()%>" ></td>
                                    </tr>
                                    <tr class="border-b-2 h-5">
                                        <td>Gender :</td>
                                        <td><%= user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr class="border-b-2 h-5">
                                        <td>Photo :</td>
                                        <td><input class="w-full" type="file" name="user_pic" value="" ></td>
                                    </tr>
                                </table>
                                <div class="mx-auto w-fit">
                                    <button type="submit" id="saveBtn" class="border border-sky-500 py-0.5 px-2 bg-transparent text-sky-500 rounded-md mt-2 hover:bg-sky-500 hover:text-white ">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="py-1 px-4 flex justify-end items-center">
                    <div class="flex items-center space-x-4">
                        <button id="profileCloseBtn"  class="bg-slate-500 hover:bg-slate-600 text-white font-bold py-2 px-4 rounded">Close</button>
                        <button id="editBtn" class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--        End of Profile Modal-->


        <!--        Post Modal-->

        <div id="postModal" class="hidden fixed z-10 h-full w-full overflow-auto bg-black/40">
            <!-- Modal content -->
            <div class="modal-content rounded-lg relative mx-auto w-[50%] shadow-md  mt-2 bg-[#fefefe]">
                <div class="py-3 px-4 rounded-lg rounded-b-none bg-sky-500 ">
                    <span id="postClose" class=" text-white px-1 transition ease-in-out delay-150 hover:text-red-400 float-right font-bold text-2xl h-full pb-10 cursor-pointer">&times;</span>
                    <h2 class="text-white font-bold text-lg">Create a blog post</h2>
                </div>
                <div class="py-3 px-4">
                    <div class="flex flex-col content-center gap-1">
                        <div id="" class="">
                            <form id="addPostForm" action="AddPostServlet" method="POST" enctype="multipart/form-data">
                                <select class="my-1 w-full border p-0.5" name="category_id">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        for (Category c : categories) {
                                    %>
                                    <option value="<%= c.getId()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <input name="post_title" class="my-1 w-full border p-0.5" type="text" placeholder="Enter your post title">
                                <textarea name="post_content" rows="4" placeholder="Enter your content" class="my-1 w-full border p-0.5"></textarea>
                                <textarea name="post_code" rows="4" placeholder="Enter your code (If any)" class="my-1 w-full border p-0.5"></textarea>
                                <label >Select your pic : </label><br>
                                <input type="file" name="post_image">
                                <div class="mx-auto w-fit">
                                    <button type="submit" id="" class="border-2 border-sky-500 py-0.5 px-2 bg-transparent text-sky-500 rounded-md  text-lg mt-2 hover:bg-sky-500 hover:text-white ">Post</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--        End of Post Modal-->
        
                <!--        Page Body-->

        <main>
            <div class="m-4 flex">
                <div class="flex flex-col w-[30%] border h-fit">
                    <div class="c-link w-full p-2 bg-sky-500 text-white border cursor-pointer" onclick="getPosts(0,this)">
                        <a  href="#" class="text-xl">All Post</a>
                    </div>

                    <%
                        for (Category c : categories) {

                    %>
                    <div class="c-link w-full p-2 border cursor-pointer" onclick="getPosts(<%= c.getId() %>,this)">
                        <a href="#"  class="text-xl"><%= c.getName()%></a>
                    </div>

                    <% }%>
                </div>

                <div class="w-[70%]">
                    <div class="text-center" id="loader">
                        <i class="fa fa-refresh fa-3x animate-spin text-sky-500"></i>
                        <h3 class="text-sky-500 mt-2 text-md">Loading...Please wait</h3>
                    </div>
                    <div id="post-container" class="mx-4">
                        
                    </div>
                </div>

            </div>
        </main>

        <!--        End of Page Body-->


        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="js/app.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                var profileModal = $("#profileModal");
                var postModal = $("#postModal");

                $("#postBtn").click(function (e) {
                    postModal.show();
                });

//                $("#postCloseBtn").click(function (e) {
//                    postModal.hide();
//                });
                $("#postClose").click(function (e) {
                    postModal.hide();
                });

                $("#profileBtn").click(function (e) {
                    e.preventDefault();
                    profileModal.show();
                });

                $("#profileCloseBtn").click(function (e) {
                    e.preventDefault();
                    profileModal.hide();
                });

                $("#profileClose").click(function (e) {
                    e.preventDefault();
                    profileModal.hide();
                });

                $(window).click(function (e) {
                    //e.preventDefault();
                    if ($(e.target).is(profileModal)) {
                        profileModal.hide();
                    }
                    if ($(e.target).is(postModal)) {
                        postModal.hide();
                    }
                });
                let editStatus = false;
                $("#editBtn").click(function (e) {
                    if (editStatus === false) {
                        $("#profile-details").hide();
                        $("#edit-profile").show();
                        $(this).text("Back");
                        editStatus = true;
                    } else {
                        $("#profile-details").show();
                        $("#edit-profile").hide();
                        $(this).text("Edit");
                        editStatus = false;
                    }
                });
            });
        </script>

        <!--        now add post js-->
        <script>
            $(document).ready(function (e) {
                $("#addPostForm").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === "done") {
                                $("#addPostForm").get(0).reset();
                                Swal.fire({
                                    title: "Well Done!",
                                    text: "Your blog has been posted",
                                    icon: "success"
                                }).then((value) => {
                                    window.location = "profile_page.jsp";
                                });
                            } else {
                                Swal.fire({
                                    title: "Oops!",
                                    text: "Something went wrong",
                                    icon: "error"
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            Swal.fire({
                                title: "Oops!",
                                text: "Something went wrong",
                                icon: "error"
                            });
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>


        <!--        loading post using ajax-->
        <script>
            
            function getPosts(catId,temp){
                $("#loader").show();
                $("#post-container").hide();
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid : catId},
                    success: function (data, textStatus, jqXHR) {
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                    }
                });
                
                if(temp !== null){
                    $(".c-link").removeClass("bg-sky-500 text-white");
                    $(temp).addClass("bg-sky-500 text-white");
                }
            }
            
            $(document).ready(function(e){
                getPosts(0,null);
            });
        </script>
    </body>
</html>
