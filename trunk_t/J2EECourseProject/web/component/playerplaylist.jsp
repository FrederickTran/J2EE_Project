<%-- 
    Document   : playerplaylist
    Created on : Apr 16, 2017, 10:03:32 AM
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
        <div class="container-fluid main_content_table_cell full_expand smooth_transform" id="side_bench_media_player">
            <div class="row no_gutter">
                <%@include file="mediaplayer.jsp" %>
            </div>

            <div class="row no_gutter">
                <div id="song_list_player" class="song_list has_scrollbar">
                    <div class="song_item unselectable_obj">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <div id="button-minus" class="control-song-item" >
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" >
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" >
                                <i class="glyphicon glyphicon-heart"></i>
                            </div>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">Cannon in D</p>
                            <p class="song_musician unselectable_obj">J. Pachelbel</p>
                            <hr class="unselectable_obj">
                        </div>
                    </div>
                    <div class="song_item unselectable_obj" style="animation: slidein 0.4s;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <div id="button-minus" class="control-song-item" >
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" >
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" >
                                <i class="glyphicon glyphicon-heart"></i>
                            </div>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">Cannon in D</p>
                            <p class="song_musician unselectable_obj">J. Pachelbel</p>
                            <hr class="unselectable_obj">
                        </div>
                    </div>
                    <div class="song_item unselectable_obj" style="animation: slidein 0.4s;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <div id="button-minus" class="control-song-item" >
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" >
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" >
                                <i class="glyphicon glyphicon-heart"></i>
                            </div>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">St. John's Passion</p>
                            <p class="song_musician unselectable_obj">J.S Bach</p>
                            <hr class="unselectable_obj">
                        </div>
                    </div>
                    <div class="song_item unselectable_obj" style="animation: slidein 0.4s;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <div id="button-minus" class="control-song-item" >
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" >
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" >
                                <i class="glyphicon glyphicon-heart"></i>
                            </div>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">Cannon in D</p>
                            <p class="song_musician unselectable_obj">J. Pachelbel</p>
                            <hr class="unselectable_obj">
                        </div>
                    </div>
                    <div class="song_item unselectable_obj" style="animation: slidein 0.4s;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <div id="button-minus" class="control-song-item" >
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" >
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" >
                                <i class="glyphicon glyphicon-heart"></i>
                            </div>
                        </div>
                        <div class="unselectable_obj">
                            <p class="song_name unselectable_obj">St. John's Passion</p>
                            <p class="song_musician unselectable_obj">J.S Bach</p>
                            <hr class="unselectable_obj">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
