<%-- 
    Document   : signin
    Created on : Apr 27, 2017, 11:20:29 PM
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
        <div id="modal_sign_in" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sign In</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">

                            <div class="row">
                                <label for="user_input_sign_in_ID" class="col-md-3">Login ID:</label>
                                <input type="text" id="user_input_sign_in_ID"/>
                            </div>

                            <div class="row">
                                <label for="user_input_sign_in_password" class="col-md-3">Password:</label>
                                <input type="password" id="user_input_sign_in_password"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <p>Don't have an account yet? <nobr><a data-dismiss="modal" data-toggle="modal" data-target="#modal_sign_up" >Sign Up</a></nobr> now.</p>
                        <button id="button-sign-in" type="submit" class="btn btn-default">Sign In</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
