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
        <div class="row main no_gutter main_content_table">
            <div class="container-fluid main_content_table_cell full_expand smooth_transform" id="side_bench_media_player">
                <div class="row no_gutter">
                    <%@include file="mediaplayer.jsp" %>
                </div>
                <div class="row no_gutter">
                    <div class="has_scrollbar">
                        <div id="song_list_player" class="song_list">

                        </div>
                    </div>
            </div>
            </div>
            
        </div>
    </body>
</html>
