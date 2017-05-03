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
        <div class="form-group search_box_1">
            <div class="container-fluid">
                <form id="search-form">
                <div id="logo-search-box" class="row">
                    <div id="logo-search">
                        <img class="logo" src="res/logo.png" style="display: block">
                        <input type="text" id="main_search_box_key_word" name="search-input" class="form-control" >
                        </div>
                    </div>
                <div id="button-search-tray" class="row">
                    <div id="button-search-control">                
                        <input id="button-search-for-song" type="submit" name="text-search-for-song" value="Search For Song"/>
                        <input id="button-term-of-service" type="button" name="text-term-of-Service" value="Term Of Service" data-toggle="modal" data-target="#modal_term_of_service"/>       
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
