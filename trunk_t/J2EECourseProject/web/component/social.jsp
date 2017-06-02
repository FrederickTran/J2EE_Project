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
                    <a id="menu1-tab" data-toggle="pill" href="#menu1">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>Play List
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
                <li>
                    <a href="#" id="download-music" target="blank">
                        <span class="glyphicon glyphicon-download" aria-hidden="true"></span>Download
                    </a>
                </li> 
            </ul>
            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active">
                    <span>List songs</span>
                    <div class="row no_gutter">
                        <div id="song_list_player" class="song_list has_scrollbar">
                            
                        </div>
                    </div>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <span>Comment of You: </span>
                    <div>
                        <form method="post" onsubmit="Comment(); return false;">
                            <div class="col-sm-8">
                                <input class="form-control" id="user-input-comment" type="text" placeholder="Input comment your here...">
                            </div>
                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-default" id="btn-comment">Comment</button>
                            </div>          
                        </form>
                    </div>
                    <div id="list-comment" class="has_scrollbar pull-left"></div>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <span>Your link to share:</span>
                    <input type="text" class="form-control" id="link-share">
                    
                </div>
            </div>
        </div>
</body>
</html>
