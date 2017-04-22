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
        <link href="../css/color_table.css" rel="stylesheet" type="text/css"/>
        <link href="../css/boostrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/playlist/playlist.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid main_content_table_cell full_expand smooth_transform" id="side_bench_media_player" style="padding: 0px; width: 25%; height: 100%; background: var(--alpha70color10);">
            <div class="row no_gutter" style="height: 10dvh; position: relative;">
                <%@include file="mediaplayer.jsp" %>
                <p style="font-size: x-small; display: none; padding: 5px; background: #FF3B30;
                   color: #F7F7F7; vertical-align: baseline;
                   position: relative;" id="media_player_demo_sign">
                    *This is demo version, you can only listen for 10 seconds.
                    <a href="#" data-toggle="modal" data-target="modal_buy_confirm" style="background: #F7F7F7; padding: 6px; vertical-align: baseline;">Buy now</a>
                </p>
            </div>

            <div class="row no_gutter" style="height: 81vh; position: relative;">
                <div id="song_list_player" class="song_list has_scrollbar" style="padding: 0; margin: 10px 0px 0px 0px; position: relative; bottom: 0;">
                    <div class="song_item unselectable_obj" style="animation: slidein 0.4s;">
                        <div class="control_item unselectable_obj" id="control_panel">
                            <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
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
                            <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
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
                            <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
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
                            <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
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
                            <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
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
                            <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-minus"></i>
                            </div>
                            <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                                <i class="glyphicon glyphicon-share"></i>
                            </div>
                            <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
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
