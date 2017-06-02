<%-- 
    Document   : AddEditSongAdmin
    Created on : May 12, 2017, 9:06:47 PM
    Author     : ngoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib uri="WEB-INF/struts-bean.tld" prefix="bean" %>
    <%@ taglib uri="WEB-INF/struts-html.tld" prefix="html" %>
    <%@ taglib uri="WEB-INF/struts-logic.tld" prefix="logic" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/SongAdminStyle.css">
        <script src="js/songadmin.js"></script>
        <title>Add new Song | Admin</title>
        <%@include file="genericInclude.jsp" %>
    </head>
    <body>
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>

    <div class = "backgroundLayer"></div>
    <div class="background01"></div>
    <%@include file="component/adminnavigation.jsp" %>
    <div class="container-fluid full">
        <div class="row">
            <section class="content">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-container">
                                <div class="panel panel-default panel-table">
                                    <div class="panel-heading">
                                        <div class="row text-center">
                                            <h1 class="page-title">${song != null? 'Edit Song':'Add New Song'}</h1>
                                        </div>
                                    </div>
                                <div class="panel-body">
                                    <div class="col-md-8 col-md-offset-2">
                                    <html:form action="addeditsong" method="post" enctype="multipart/form-data" onsubmit="return validateSong()">
                                        <input name="songId" class="form-control hide" id="songid" value="${song != null? song.songId:''}"/>
                                        <div class="form-group">
                                          <label for="songname">Song Name</label>
                                          <input name="songName" class="form-control" id="songname" value="${song != null? song.songName:''}"/>
                                        </div>
                                        <div class="form-group">
                                            <label for="musician">Musician</label>
                                            <input type="text" name="musicianName" class="form-control" list="musicianname" value="${song != null? song.musicianName:''}"/>
                                            <datalist id="musicianname">
                                                <logic:iterate name="listMusicians" id="musician">
                                                    <option value="<bean:write name="musician" property="musicianName"/>"><bean:write name="musician" property="musicianName"/></option>
                                                </logic:iterate>
                                            </datalist>
                                        </div>
                                        <div class="form-group">
                                            <label for="singer">Singer</label>
                                            <input type="text" name="singerName" class="form-control" list="singername" value="${song != null? song.singerName:''}"/>
                                            <datalist id="singername">
                                                <logic:iterate name="listSingers" id="singer">
                                                    <option value="<bean:write name="singer" property="singerName"/>"><bean:write name="singer" property="singerName"/></option>
                                                </logic:iterate>
                                            </datalist>
                                        </div>
                                        <div class="form-group">
                                          <label for="price">Price</label>
                                          <input name="price" class="form-control" id="price" value="${song != null? song.price:''}"/>
                                        </div>
                                        <div class="form-group">
                                          <label for="file">Music File</label>
                                          <p 
                                              <c:if test="${song == null}">
                                              class="hide"
                                              </c:if>
                                              >${song != null && filename != null? filename:''}</p>
                                          <input type="file" name="file" class="form-control file-loading" id="file"/>
                                          <small id="fileHelp" class="form-text text-muted">Please select a mp3/mp4 file to upload.</small>
                                        </div>
                                        <div class="col-md-4 col-md-offset-4">
                                            <button type="submit" class="form-control btn btn-primary">Submit</button>
                                        </div>
                                      </html:form>
                                    </div>
                                </div>
                        <div class="panel-footer">
                            
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <div class="content-footer">

    </div>
</div>
</section>
</div>
</div> <!-- container -->
    </body>
</html>
