<%-- 
    Document   : Home
    Created on : Mar 26, 2017, 9:57:47 AM
    Author     : NguyenPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="WEB-INF/struts-logic.tld" prefix="logic" %>
<!-- Khai báo import -->
<%@ page import="java.util.*, java.text.*"  %>  

<%@ page import="java.util.List, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Music</title>
        <!--CSS-->
        <link type="text/css" rel="stylesheet" href="css/color_table.css"/>
        <link type="text/css" rel="stylesheet" href="css/layout.css"/>
        <link type="text/css" rel="stylesheet" href="css/boostrap/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="css/boostrap/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="css/navigation_2/navigation_bar_2.css"/>
        <link type="text/css" rel="stylesheet" href="css/gallery_1/gallery_1.css"/>
        <link type="text/css" rel="stylesheet" href="css/search_box_1/search_box_1.css"/>


        <script src="css/boostrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="css/boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="css/boostrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid full" style="height: 100%; padding: 0; margin: 0;">
            <div class="row no_gutter">
                <div id="menu" style="width: 100%;">
                    <nav id="nav_before_login" class="navbar-default" style="padding-left: 5%; padding-right: 5%" >
                        <div class="container-fluid">
                            <div id="menu-logo" class="navbar-header" >
                                <a><img src="res/mar/icon.png" class="navbar-brand"/></a>
                            </div>
                            <ul id="nav-menu" class="nav navbar-right navbar-nav">
                                <li><a id="nav-link-faq" href="<%= request.getRequestURI()%>">FAQ</a></li>
                                <li><a id="nav-link-about" href="<%= request.getRequestURI()%>">About Us</a></li>
                                <li><a id="nav-link-payment" href="<%= request.getRequestURI()%>">Payment</a></li>
                                <li><a id="nav-link-policy" href="<%= request.getRequestURI()%>">Policy</a></li>
                                <li><a id="nav-link-term-of-service" href="<%= request.getRequestURI()%>">Term of service</a></li>
                                <li><a id="nav-link-random" href="<%= request.getRequestURI()%>">Random free song</a></li>
                                <li><button class="btn btn-default btn-outline btn-circle" data-toggle="modal" data-target="#modal_sign_in">Sign In</button></li>
                                <li><a id="nav-link-sign-up" data-toggle="modal" data-target="#modal_sign_up">Sign Up</a></li>
                            </ul>
                        </div>
                    </nav> <!-- navbar-default -->
                </div>
            </div> <!--row-->
        </div>
    </div>
</body>
</html>