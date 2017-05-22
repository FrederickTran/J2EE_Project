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
                    <div class="song_item unselectable_obj" id="1" style="animation: EFFECT_FADEIN;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-play"></i>
                            </button>
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </button>
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-heart"></i>
                            </button>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">No.9 Sonata Seg.2nd</p>
                            <p class="tag unselectable_obj free">Free</p>
                        </div>
                        <p class="song_musician unselectable_obj">J.S Bach</p>
                        <hr class="unselectable_obj"></div>
                    <div class="song_item unselectable_obj" id="1" style="animation: EFFECT_FADEIN;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-play"></i>
                            </button>
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </button>
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-heart"></i>
                            </button>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">No.9 Sonata Seg.2nd</p>
                            <p class="tag unselectable_obj free">Free</p>
                        </div>
                        <p class="song_musician unselectable_obj">J.S Bach</p>
                        <hr class="unselectable_obj"></div>
                    <div class="song_item unselectable_obj" id="1" style="animation: EFFECT_FADEIN;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-play"></i>
                            </button>
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </button>
                            <button class="btn btn-default btn-no-outline" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-heart"></i>
                            </button>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">No.9 Sonata Seg.2nd</p>
                            <p class="tag unselectable_obj free">Free</p>
                        </div>
                        <p class="song_musician unselectable_obj">J.S Bach</p>
                        <hr class="unselectable_obj"></div>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <span>Comment</span>
                    <p>Comment 1</p>
                    <p>Comment 2</p>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <span>Your of link:</span>
                    <input type="text" class="form-control" id="link-share">

                </div>
            </div>
        </div>
</body>
</html>
