<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <html:base/>
        <%@include file="genericInclude.jsp" %>
    </head>
    <body style="background-color: white; overflow: hidden">
        
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>
        
        <div class = "backgroundLayer"></div>
        <div class="background01"></div>
        <%@include file="component/navigation.jsp" %>
            <div class="container-fluid full" style="height: 100%; padding: 0; margin: 0;">
                <div class="row no_gutter">
                    <div class="row main no_gutter main_content_table">
                         
                        <div id="main_search_box" class="main_content_table_cell full_expand smooth_transform" align="center" >
                            <%@include file="component/searchbox.jsp" %>
                            <input id='songId' class='hide' 
                                   <c:if test="${song != null}">
                                        value='${song.songId}'
                                    </c:if>
                                   />
                        </div>
                        <div id="player-playlist">
                            <%@include file="component/playerplaylist.jsp" %>
                        </div>
                        <div id="play-list">
                            <%@include file="component/playlist.jsp" %>
                        </div>
                        
                    </div>
                </div> <!--row-->
            </div> <!-- container -->
    </body>
</html:html>
