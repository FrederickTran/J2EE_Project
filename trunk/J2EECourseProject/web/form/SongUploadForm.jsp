<%-- 
    Document   : UploadForm
    Created on : Jun 1, 2017, 2:09:39 PM
    Author     : tranminhtuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <html:form action ="/songupload" method="post" enctype="multipart/form-data">
            <bean:message key="label.songname"></bean:message><br>
            <html:text property="songName"/><br>
            <bean:message key="label.selectsong"></bean:message><br>
            <html:file property="fileData"/><br>
            <html:submit value="Submit"/>
        </html:form>
    </body>
</html>
