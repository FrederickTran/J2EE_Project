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
        <div class="nav-content">
            <div class="row no_gutter">
                <div style="width: 100%;">
                    <nav class="navbar-default" id="nav_admin">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <a href="ref_main_page"><img src="res/icon.png" class="navbar-brand"/></a>
                            </div>
                            <ul class="nav navbar-right navbar-nav">
                                <li><a href="songs.do">Song Manage</a></li>
                                <li><a href="musicians.do">Musician</a></li>
                                <li><a href="singers.do">Singer</a></li>
                                <li><a href="Welcome.do" class="btn btn-default btn-outline btn-circle" >Sign Out</a></li>
                            </ul>
                        </div>
                    </nav> <!-- navbar-default -->
                </div>
            </div> <!--row-->
            <%@include file="../dialog/signout.jsp" %>
        </div>
    </body>
</html>
