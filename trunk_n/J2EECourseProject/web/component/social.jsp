<%-- 
    Document   : social
    Created on : May 11, 2017, 10:05:31 PM
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
        <div class="container" id="social-wrapper">
            <ul class="nav nav-pills" id="social-wrapper-tab">
                <li class="active">
                    <a data-toggle="pill" href="#menu1">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> List Songs
                    </a>
                </li>

                <li>
                    <a data-toggle="pill" href="#menu2">
                        <span class="glyphicon glyphicon-comment" aria-hidden="true"></span> Comment
                    </a>
                </li>

                <li>
                    <a data-toggle="pill" href="#menu3">
                        <span class="glyphicon glyphicon-share" aria-hidden="true"></span> Share
                    </a>
                </li>               
            </ul>
            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active">
                    <span>List songs</span>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <span>Comment of You: </span>
                    <br/>                   
                        <input class="form-control" id="user-input-comment" type="text" placeholder="Input comment your here..." style="width: 95%">
                        <br/>
                        <button type="button" class="btn btn-default" id="btn-comment" onclick="Comment()">Comment</button><br/>                   
                    <span>All Comment: </span>
                    <br/>
                    <p id="list-comment">Comment 1</p>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <span>Your of link:</span>
                    <input type="text" class="form-control" id="link-share">

                </div>
            </div>
        </div>
</body>
</html>
