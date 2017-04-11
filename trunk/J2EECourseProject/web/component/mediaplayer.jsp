<%-- 
    Document   : mediaplayer
    Created on : Apr 11, 2017, 4:39:15 PM
    Author     : tuan.tranminh3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="../WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="../WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="../WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
    <head>
        <!-- CSS -->
        <link type="text/css" rel="stylesheet" href="css/color_table.css"/>
        <link type="text/css" rel="stylesheet" href="css/boostrap/css/bootstrap.css"/>

        <link type="text/css" rel="stylesheet" href="css/media_player/media_player.css"/>

        <!-- METADATA -->
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
          
    <!-- BODY -->
    <body>
        <!-- THIS IS THE CODE -->
        <div id="player">
            <div id="player-wrapper">
                <audio id="media-controler"></audio>
                <table id="player-layout">
                    <tr>
                        <td>
                            <div id="button-play" class="player-button">
                                <a><i class="glyphicon glyphicon-play-circle"></i></a>
                            </div>
                        </td>
                        <td class="grow">
                            <div id="song-info">
                                <div id="song-name">
                                    Virus
                                </div>
                                <div id="musician-name">
                                    L.V. Beethoven
                                </div>
                                <div id="time-navigate" class="navigate_bar_adjustable">
                                    <div id="time-navigate-bar">
                                        <div id="time-navigate-background" class="navigate_bar_bottom">
                                            <div id="time-navigate-downloaded" class="navigate_bar_middle">
                                                <div id="time-navigate-progress" class="navigate_bar_top">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="control-tray">
                                    <div id="control-buttons">
                                        <div id="button-next" class="player-button">
                                            <a><i class="glyphicon glyphicon-fast-forward"></i></a>
                                        </div>
                                        <div id="button-bookmark" class="player-button">
                                            <a><i class="glyphicon glyphicon-heart-empty"></i></a>
                                        </div>
                                        <div id="volume-control">
                                            <div id="button-mute" class="player-button">
                                                <a><i class="glyphicon glyphicon-volume-up"></i></a>
                                            </div>
                                            <div id="sound-navigate">
                                                <div id="sound-navigate-bar" class="navigate_bar_adjustable">
                                                    <div id="sound-navigate-background" class="navigate_bar_bottom">
                                                        <div id="sound-navigate-current" class="navigate_bar_top">

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="timer">
                                        0:00 / 0:00
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- THIS IS THE CODE -->
    </body>
</html>
