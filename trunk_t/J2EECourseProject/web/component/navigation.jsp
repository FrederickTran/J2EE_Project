<%-- 
    Document   : navigation
    Created on : Apr 27, 2017, 10:42:24 PM
    Author     : NguyenPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row no_gutter">
            <div style="width: 100%;">
                <nav class="navbar-default" id="nav_before_login"
                    <c:if test="${user != null}">
                        style="display: none"
                    </c:if>
                    >
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a href="ref_main_page"><img src="res/icon.png" class="navbar-brand"/></a>
                        </div>
                        <ul class="nav navbar-right navbar-nav">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#modal_term_of_service">Term of service</a></li>
                            <li><a href="#">Random free song</a></li>
                            <li><button class="btn btn-default btn-outline btn-circle" data-toggle="modal" data-target="#modal_sign_in">Sign In</button></li>
                            <li><a href="#" data-toggle="modal" data-target="#modal_sign_up">Sign Up</a></li>
                        </ul>
                    </div>
                </nav> <!-- navbar-default -->

                <nav class="navbar-default" id="nav_after_login"
                    <c:if test="${user != null}">
                        style="display: inherit"
                    </c:if>
                     >
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a href="ref_main_page"><img src="res/icon.png" class="navbar-brand"/></a>
                        </div>
                        <ul class="nav navbar-right navbar-nav">
                            <li><a href="upload.do">Upload</a></li>
                            <li><a href="#">My Playlist</a></li>
                            <li><a href="#">My Song</a></li>
                            <li><a href="#">Random</a></li>
                            <li><a id="user-name-loged" href="#">
                                <c:if test="${user != null}">
                                    ${user.name}
                                </c:if>
                                </a></li>
                            <li><button class="btn btn-default btn-outline btn-circle" data-toggle="modal" data-target="#modal_sign_out">Sign Out</button></li>
                        </ul>
                    </div>
                </nav> <!-- navbar-default -->
            </div>
        </div> <!--row-->
        <%@include file="../dialog/signup.jsp" %>
        <%@include file="../dialog/signin.jsp" %>
        <%@include file="../dialog/termofservice.jsp" %>
        <%@include file="../dialog/signupsucessful.jsp" %>
        <%@include file="../dialog/signout.jsp" %>
    </body>
</html>
