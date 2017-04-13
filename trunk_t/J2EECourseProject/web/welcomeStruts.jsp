<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <html:base/>
        <%@include file="genericInclude.jsp" %>
    </head>
    <body style="background-color: white">
        
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>
        
        <table>
            <tr>
                <td>
                    <%try {%>
                        <bean:write name="UserActionform" property="message"/>
                    <%} catch(Exception e){} %>
                    <jsp:include page="form/sampleform.jsp"/>
                </td>
                <td>
                    <h3><bean:message key="welcome.heading"/></h3>
                    <p><bean:message key="welcome.message"/></p>
                </td>
            </tr>
        </table>        
        <%@include file="component/mediaplayer.jsp" %>
    </body>
</html:html>
