<%-- 
    Document   : signup
    Created on : Apr 27, 2017, 11:52:57 PM
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
        <div id="modal_sign_up" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sign Up</h4>
                    </div>
                    <form action="" method="POST" id="signup-form" class="container-fluid" style="border: solid var(--color07) 1px; padding: 0px 0px 10px 0px;">
                        <div class="modal-body">
                            <div class="form-group container-fluid">
                                <div class="attention_block row">
                                    <p>
                                        Beside of Free songs, some other songs in this site is require payment, please make sure you have read our <nobr><a href="#" onclick="openTermOfService()">Term of Service</a></nobr> before continue.
                                    </p>
                                </div>
                                <div class="row">
                                    <label for="user_input_user_name" class="col-md-4">Full name:</label>
                                    <input type="text" id="user_input_user_name"/>
                                </div>

                                <div class="row">
                                    <label for="user_input_user_loginid" class="col-md-4">Login ID:</label>
                                    <input type="text"id="user_input_user_loginid" required/>
                                </div>

                                <div class="row">
                                    <label for="user_input_user_password" class="col-md-4">Password:</label>
                                    <input type="password" id="user_input_user_password" required/>
                                </div>

                                <div class="row">
                                    <label for="user_input_user_confirm_password" class="col-md-4">Confirm Password:</label>
                                    <input type="password" id="user_input_user_confirm_password" required/>
                                </div>

                                <%@include file="../component/paymentInfo.jsp" %>
                        </div>
                    
                        <div class="modal-footer">
                            I have read and accept <nobr><a href="#" data-toggle="modal" data-target="#modal_term_of_service">Term of Service</a></nobr> <input type="checkbox" onchange="onTermOfServiceCheckboxChange(this)">
                            <button id="btn_sign_up" type="submit" class="btn btn-default" disabled >Sign Up</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
