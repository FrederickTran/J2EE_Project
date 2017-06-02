<%-- 
    Document   : SingerAdmin
    Created on : May 31, 2017, 11:22:10 PM
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
        <title>Singer Admin</title>
        <%@include file="genericInclude.jsp" %>
        
    </head>
    <body onload="onLoadSingerAdmin()">
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>

    <div class = "backgroundLayer"></div>
    <div class="background01"></div>
    <%@include file="component/adminnavigation.jsp" %>
    <div class="container-fluid full content">
        <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="col col-md-6 text-left">
                                <table>
                                    <tr>
                                        <td><label for="dropdownnum">Items per page:</label></td>
                                        <td> <div class="btn-group" id="dropdownnum">
                                                <a class="btn btn-default dropdown-toggle btn-selectUS" data-toggle="dropdown" href="#" id="btnRegion" 
                                                   <c:if test="${key != null}">
                                                           disabled
                                                    </c:if>
                                                   >${recordPerPage}
                                                    <span class="caret"></span>
                                                </a>
                                                <ul 
                                                    <c:if test="${key != null}">
                                                           class="hide"
                                                    </c:if>
                                                    <c:if test="${key == null}">
                                                           class="dropdown-menu"
                                                    </c:if>>
                                                    <li><a href="#">5</a></li>
                                                    <li><a href="#">10</a></li>
                                                    <li><a href="#">15</a></li>
                                                    <li><a href="#">20</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label>Sort By Name:</label></td>
                                        <td><div list-group-item >
                                            <div class="material-switch">
                                                <input class="hide" id="sort-by-name" name="sort-by-name" type="checkbox" onChange="getPageSinger(${curPage})"
                                                       <c:if test="${sort == true}">
                                                           checked
                                                       </c:if>
                                                       <c:if test="${key != null}">
                                                           disabled
                                                       </c:if>
                                                       />
                                                <label for="sort-by-name" class="label-success"></label>
                                            </div>
                                        </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col col-xs-6 text-right btn-group">

                                <form class="navbar-form" role="search" onsubmit="return searchSinger()">
                                    <div class="input-group add-on">
                                        <input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text" value="${key}">
                                        <div class="input-group-btn">
                                            <button class="btn btn-primary" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="table-container">
                                <div class="panel panel-default panel-table">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col col-xs-12 text-center">
                                                <a type="button" href="singers.do?task=add" class="btn btn-sm btn-primary btn-create" >Add New Singer</a>
                                            </div>
                                        </div>
                                    </div>
                                <div class="panel-body has_scrollbar">
                                    <table class="table table-filter" id="table-songs">
                                        <tbody>
                                            <th class="song-name" width="35%">Singer Name</th>
                                            <th class="author" width="50%">Singer Info</th>
                                            <th class="manage" width="15%">Update</th>

                                            <logic:iterate name="listSingers" id="singer">
                                            <tr data-status="pendiente" id="<bean:write name="singer" property="singerId"/>">
                                            <td>
                                                <div class="media">
                                                    <a href="#" class="pull-left">
                                                        <img src="res/music.png" class="media-photo">
                                                    </a>
                                                    <div class="media-body">
                                                        <h4 class="title">
                                                            <bean:write name="singer" property="singerName"/>
                                                        </h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td><span class="pendiente"><bean:write name="singer" property="info"/></span></td>
                                            
                                            <td class = manage-button>

                                                <a class="btn btn-default glyphicon glyphicon-pencil" href="singers.do?task=edit&id=<bean:write name="singer" property="singerId"/>" ></a>
                                            </td>
                                            </tr>
                                            </logic:iterate>
                                        </tbody>
                                    </table>
                                </div>
                        <div class="panel-footer">
                            <div class="row">
                                Page ${curPage} of ${maxPage}
                                <div class="col col-xs-12 text-center">
                                    
                                    <div class="card-footer p-0">
                                        <nav aria-label="...">
                                            <ul class="pagination justify-content-end mt-3 mr-3 pager">
                                                <c:if test = "${curPage > 1}">
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" onclick="getPageSinger(${curPage - 1})">Previous</a>
                                                    </li>
                                                </c:if>
                                                <c:if test = "${curPage <= 1}">
                                                    <li class="page-item disabled">
                                                        <span class="page-link">Previous</span>
                                                    </li>
                                                </c:if>
                                                <c:forEach var="i" begin="${curPage-9>=1?curPage-9:1}" end="${curPage-1}">  
                                                    <li class="page-item"><a class="page-link" href="#" onclick="getPageSinger(${i})">${i}</a></li>
                                                </c:forEach>  
                                                <li class="page-item active">
                                                    <span class="page-link" id="curPage">${curPage}</span>
                                                </li>
                                                <c:forEach var="j" begin="${curPage+1}" end="${curPage+9<=maxPage?curPage+9:maxPage}">  
                                                    <li class="page-item"><a class="page-link" href="#" onclick="getPageSinger(${j})">${j}</a></li>
                                                </c:forEach> 
                                                <c:if test = "${curPage < maxPage}">
                                                    <li class="page-item ">
                                                        <a class="page-link" href="#" onclick="getPageSinger(${curPage + 1})">Next</a>
                                                    </li>
                                                </c:if>
                                                <c:if test = "${curPage == maxPage}">
                                                    <li class="page-item disabled">
                                                        <span class="page-link">Next</span>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <div class="content-footer">

    </div>
</div>
</div>
</div> <!-- container -->
</body>
</html>

