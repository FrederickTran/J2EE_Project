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
        <title>Search Box</title>
        <!--CSS-->
    </head>
    <body>
        <div class = "backgroundLayer"></div>
        <div class="background01"></div>
        <div class="container-fluid full" style="height: 100%; padding: 0; margin: 0;">
            <div class="row no_gutter">
        <div class="row main no_gutter main_content_table">
        <div id="main_search_box" class="main_content_table_cell full_expand smooth_transform" align="center" >
            <div class="form-group search_box_1">
                <div class="container-fluid">
                    <div id="logo-search-box" class="row">
                        <div id="logo-search" class="col-md-12">
                            <img class="logo" src="res/logo.png" style="display: block">
                            <input type="text" id="main_search_box_key_word" name="search-input" class="form-control" >
                        </div>
                    </div>
                    <div id="button-search-tray" class="row">
                        <div id="button-search-control" >                       
                            <input id="button-search-for-song" type="submit" name="text-search-for-song" value="Search For Song"/>
                            <input id="button-term-of-service" type="submit" name="text-term-of-Service" value="Term Of Service"/>       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div> <!--row-->
    </body>
</html>
