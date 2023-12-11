<%-- 
    Document   : error_page
    Created on : 11-Dec-2023, 6:48:13 pm
    Author     : KIIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry, something went wrong...</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container mx-auto w-fit mt-4">
            <img src="img/warning.png" class="mx-auto h-96 w-96">
            <%= exception %>
            <h3 class="font-light text-4xl">Sorry, Something went wrong...</h3><br>
            <a href="index.jsp" class="bg-sky-500 p-2 rounded mx-40 ml-48 text-white font-bold hover:shadow hover:shadow-sky-500">Home</a>
        </div>
    </body>
</html>
