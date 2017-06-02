<%-- 
    Document   : AddEditMusicianAdmin
    Created on : May 30, 2017, 9:18:21 PM
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
        <title>Add / Edit Musician | Admin</title>
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
                                            <h1 class="page-title">${musician != null? 'Edit Musician':'Add New Musician'}</h1>
                                        </div>
                                    </div>
                                <div class="panel-body">
                                    <div class="col-md-8 col-md-offset-2">
                                    <html:form action="addeditmusician" method="post" onsubmit="return validateMusician()">
                                        <input name="musicianId" class="form-control hide" id="musicianid" value="${musician != null? musician.musicianId:''}"/>
                                        <div class="form-group">
                                          <label for="songname">Musician Name</label>
                                          <input name="musicianName" class="form-control" id="musicianname" value="${musician != null? musician.musicianName:''}"/>
                                        </div>
                                        <div class="form-group">
                                          <label for="price">Musician Info</label>
                                          <textarea type="area" name="info" class="form-control" id="info">${musician != null? musician.info:''}</textarea>
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
