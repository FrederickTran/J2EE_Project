<%-- 
    Document   : Home
    Created on : Mar 26, 2017, 9:57:47 AM
    Author     : NguyenPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Music</title>
        <!--CSS-->
    <link type="text/css" rel="stylesheet" href="css/color_table.css"/>
    <link type="text/css" rel="stylesheet" href="css/layout.css"/>
    <link type="text/css" rel="stylesheet" href="css/boostrap/css/bootstrap.css"/>
    <link type="text/css" rel="stylesheet" href="css/navigation_2/navigation_bar_2.css"/>
    <link type="text/css" rel="stylesheet" href="css/gallery_1/gallery_1.css"/>
    <link type="text/css" rel="stylesheet" href="css/search_box_1/search_box_1.css"/>
    </head>
    <body>
        <div class = "backgroundLayer"></div>
        <div class="background01"></div>
        <div class="container-fluid full" style="height: 100%; padding: 0; margin: 0;">
            <div class="row no_gutter">
        <div style="width: 100%;">
            <nav class="navbar-default" style="padding-left: 5%; padding-right: 5%" id="nav_before_login">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a href="ref_main_page" onclick="#"><img src="res/mar/icon.png" class="navbar-brand"/></a>
                    </div>
                    <ul class="nav navbar-right navbar-nav">
                        <li><a href="#" onclick="searchWithKey()">FAQ</a></li>
                        <li><a href="#" onclick="searchWithKey()">About Us</a></li>
                        <li><a href="#" onclick="searchWithKey()">Payment</a></li>
                        <li><a href="#" onclick="searchWithKey()">Policy</a></li>
                        <li><a href="#" onclick="searchWithKey()">Term of service</a></li>
                        <li><a href="#" onclick="randomPlaylist()">Random free song</a></li>
                        <li><button class="btn btn-default btn-outline btn-circle" data-toggle="modal" data-target="#modal_sign_in">Sign In</button></li>
                        <li><a href="#" data-toggle="modal" data-target="#modal_sign_up">Sign Up</a></li>
                    </ul>
                </div>
            </nav> <!-- navbar-default -->
        </div>
    </div> <!--row-->
    <div class="row main no_gutter main_content_table">
        <div class="main_content_table_cell full_expand smooth_transform" align="center" id="main_search_box">
            <div class="form-group search_box_1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <img class="logo" src="res/mar/logo.png" style="display: block">
                            <input type="text" class="form-control" id="main_search_box_key_word" onkeypress="onSearchBoxKeyPress(event)">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-default" onclick="searchWithKey()">Search for song</button>
                            <button class="btn btn-default" onclick="openTermOfService()">Term of service</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
