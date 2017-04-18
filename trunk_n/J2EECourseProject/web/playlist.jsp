<%-- 
    Document   : playlist
    Created on : Apr 16, 2017, 10:03:13 AM
    Author     : NguyenPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/boostrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/playlist/playlist.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main_content_table_cell has_scrollbar smooth_transform" id="side_bench_search_list" style="width: 33%; height: 100%; background: var(--alpha40color10);">
            <div id="song_list_search" class="song_list" style="padding: 0;">
                <div class="song_item unselectable_obj" id="0" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Virus</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="1" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Moonlight Sonata</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="2" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">No.9 Sonata Seg.2nd</p>
                        <p class="tag unselectable_obj free">Free</p>
                    </div>
                    <p class="song_musician unselectable_obj">J.S Bach</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="3" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
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
                        <p class="tag unselectable_obj free">Free</p>
                    </div>
                    <p class="song_musician unselectable_obj">J. Pachelbel</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="0" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Virus</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="1" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Moonlight Sonata</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="2" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">No.9 Sonata Seg.2nd</p>
                        <p class="tag unselectable_obj free">Free</p>
                    </div>
                    <p class="song_musician unselectable_obj">J.S Bach</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="3" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
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
                        <p class="tag unselectable_obj free">Free</p>
                    </div>
                    <p class="song_musician unselectable_obj">J. Pachelbel</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="0" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Virus</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="1" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Moonlight Sonata</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="2" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">No.9 Sonata Seg.2nd</p>
                        <p class="tag unselectable_obj free">Free</p>
                    </div>
                    <p class="song_musician unselectable_obj">J.S Bach</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="3" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
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
                        <p class="tag unselectable_obj free">Free</p>
                    </div>
                    <p class="song_musician unselectable_obj">J. Pachelbel</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="0" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Virus</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
                <div class="song_item unselectable_obj" id="1" style="animation: fadein 0.4s;">
                    <div class="control_item unselectable_obj" id="control_panel">
                        <div id="button-play" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-play"></i>
                        </div>
                        <div id="button-share" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-share"></i>
                        </div>
                        <div id="button-heart" class="control-song-item" style="margin: 0px; padding: 5px;">
                            <i class="glyphicon glyphicon-heart"></i>
                        </div>
                    </div>
                    <div class="unselectable_obj">
                        <p class="song_name unselectable_obj">Moonlight Sonata</p>
                        <p class="tag unselectable_obj sale_off">$0.32</p>
                    </div>
                    <p class="song_musician unselectable_obj">L.v Beethoven</p>
                    <hr class="unselectable_obj">
                </div>
            </div>
    </body>
</html>
