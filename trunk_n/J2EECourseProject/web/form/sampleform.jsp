<%-- 
    Document   : sampleform
    Created on : Mar 4, 2017, 1:57:06 AM
    Author     : tranminhtuan
--%>
<%@ taglib uri="../WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="../WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <html:form action="/login">
            <table border="0">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Account ID:</td>
                        <td><html:text property="accountID"/></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><html:password property="password"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td> <html:submit value="Login"/></td>
                    </tr>
                </tbody>
            </table>
        </html:form>
    </body>
</html>
