<%-- 
    Document   : sampledialog
    Created on : Mar 4, 2017, 2:04:32 AM
    Author     : tranminhtuan
--%>
<%@ taglib uri="../WEB-INF/struts-bean.tld" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login successful!</h1>
        <p>Welcome <bean:write name="SampleDialog" property="id"/></p>
    </body>
</html>
