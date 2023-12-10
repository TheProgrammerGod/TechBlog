
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
                <a href="register_page.jsp" class="text-sm rounded-md py-1 px-1.5 mr-2 bg-none text-white border border-white hover:text-black hover:bg-white">Get Started</a>
                <a href="login_page.jsp" class="text-sm rounded-md py-1 px-1.5 bg-none text-white border border-white hover:text-black hover:bg-white">Login</a>
            </div>

        </div>

        <!--        Cards-->
        <div class="container mx-auto px-4 py-8">
            <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <div class="relative flex flex-col mx-auto mt-6 text-gray-700 bg-white shadow-md bg-clip-border rounded-xl w-64">
                    <div class="p-6">
                        <h5 class="block mb-2 font-sans text-xl antialiased font-semibold leading-snug tracking-normal text-blue-gray-900">
                            UI/UX Review Check
                        </h5>
                        <p class="block font-sans text-base antialiased font-light leading-relaxed text-inherit">
                            Because it's about motivating the doers. Because I'm here to follow my
                            dreams and inspire others.
                        </p>
                    </div>
                    <div class="p-6 pt-0 pl-6">
                        <a href="#" class="inline-block">
                            <button
                                class="flex items-center gap-2 px-2 py-2 text-xs bg-sky-500 font-bold text-center text-white uppercase align-middle transition-all rounded-lg select-none disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none hover:bg-white hover:text-black active:bg-gray-900/20"
                                type="button">
                                Read More
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                                     stroke="currentColor" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3"></path>
                                </svg>
                            </button>
                        </a>
                    </div>
                </div> 

                <div class="relative mx-auto flex flex-col mt-6 text-gray-700 bg-white shadow-md bg-clip-border rounded-xl w-64">
                    <div class="p-6">
                        <h5 class="block mb-2 font-sans text-xl antialiased font-semibold leading-snug tracking-normal text-blue-gray-900">
                            UI/UX Review Check
                        </h5>
                        <p class="block font-sans text-base antialiased font-light leading-relaxed text-inherit">
                            Because it's about motivating the doers. Because I'm here to follow my
                            dreams and inspire others.
                        </p>
                    </div>
                    <div class="p-6 pt-0 pl-6">
                        <a href="#" class="inline-block">
                            <button
                                class="flex items-center gap-2 px-2 py-2 text-xs bg-sky-500 font-bold text-center text-white uppercase align-middle transition-all rounded-lg select-none disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none hover:bg-white hover:text-black active:bg-gray-900/20"
                                type="button">
                                Read More
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                                     stroke="currentColor" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3"></path>
                                </svg>
                            </button>
                        </a>
                    </div>
                </div> 

                <div class="relative mx-auto flex flex-col mt-6 text-gray-700 bg-white shadow-md bg-clip-border rounded-xl w-64">
                    <div class="p-6">
                        <h5 class="block mb-2 font-sans text-xl antialiased font-semibold leading-snug tracking-normal text-blue-gray-900">
                            UI/UX Review Check
                        </h5>
                        <p class="block font-sans text-base antialiased font-light leading-relaxed text-inherit">
                            Because it's about motivating the doers. Because I'm here to follow my
                            dreams and inspire others.
                        </p>
                    </div>
                    <div class="p-6 pt-0 pl-6">
                        <a href="#" class="inline-block">
                            <button
                                class="flex items-center gap-2 px-2 py-2 text-xs bg-sky-500 font-bold text-center text-white uppercase align-middle transition-all rounded-lg select-none disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none hover:bg-white hover:text-black active:bg-gray-900/20"
                                type="button">
                                Read More
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                                     stroke="currentColor" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3"></path>
                                </svg>
                            </button>
                        </a>
                    </div>
                </div> 
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="js/app.js" type="text/javascript"></script>
    </body>
</html>
