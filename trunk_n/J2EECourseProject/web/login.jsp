<%-- 
    Document   : login
    Created on : Apr 16, 2017, 8:36:45 AM
    Author     : NguyenPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="../css/color_table.css" rel="stylesheet" type="text/css"/>
<link href="css/boostrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="css/boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="css/model/model.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--Sign up-->
        <div id="modal_sign_up" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sign Up</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group container-fluid">
                            <div class="attention_block row">
                                <p>
                                    Beside of Free songs, some other songs in this site is require payment, please make sure you have read our <nobr><a href="<%= request.getRequestURI()%>">Term of Service</a></nobr> before continue.
                                </p>
                            </div>
                            <div class="row">
                                <label for="user_input_user_name" class="col-md-4">Full name:</label>
                                <input type="text" style="width: 50%" id="user_input_user_name"/>
                            </div>

                            <div class="row">
                                <label for="user_input_user_loginid" class="col-md-4">Login ID:</label>
                                <input type="text" style="width: 50%" id="user_input_user_loginid" required/>
                            </div>

                            <div class="row">
                                <label for="user_input_user_password" class="col-md-4">Password:</label>
                                <input type="password" style="width: 50%" id="user_input_user_password" required/>
                            </div>

                            <div class="row">
                                <label for="user_input_user_confirm_password" class="col-md-4">Confirm Password:</label>
                                <input type="password" style="width: 50%" id="user_input_user_confirm_password" required/>
                            </div>

                            <label style="margin-top: 10px;;">Payment information:</label>
                            <form action="" method="POST" id="payment-form" class="container-fluid" style="border: solid var(--color07) 1px; padding: 0px 0px 10px 0px;">
                                <div class="row">
                                    <label class="col-md-4">Name</label>
                                    <input type="text" size="20" autocomplete="off" class="name" required>
                                </div>
                                <div class="row">
                                    <label class="col-md-4">Address Line 1</label>
                                    <input type="text" size="20" autocomplete="off" class="address_line1" required>
                                </div>
                                <div class="row">
                                    <label class="col-md-4">Address Line 2</label>
                                    <input type="text" size="20" autocomplete="off" class="address_line2">
                                </div>
                                <div class="row">
                                    <label class="col-md-4">Address Zip</label>
                                    <input type="text" size="20" autocomplete="off" class="address_zip" required>
                                </div>
                                <div class="row">
                                    <label class="col-md-4">Address Country</label>
                                    <select class="address_country" style="width: 50%;" required>
                                        <option value=""></option>
                                        <option value="AF">Afghanistan</option>
                                        <option value="AX">Åland Islands</option>
                                        
                                    </select>
                                </div>
                                <div class="row">
                                    <label class="col-md-4">Card Number</label>
                                    <input type="text" size="20" autocomplete="off" class="card-number" value="" required>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>CVV Code<br><span class="hint">last 3 digits -&gt;</span></label><img src="mar/cvv.png" alt="CVV" style="margin-left: 10px">
                                    </div>
                                    <input type="text" size="4" autocomplete="off" class="card-cvc" value="" required>
                                </div>
                                <div class="row">
                                    <label class="col-md-4">Expiration (MM/YY)</label>
                                    <input type="text" size="2" maxlength="2" class="card-expiry-month" value="" required><label style="font-size: large; padding-left: 5px">/</label>
                                    <input type="text" size="2" maxlength="2" class="card-expiry-year" value="" required>
                                </div>
                                <div class="clear"></div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        I have read and accept <nobr><a href="#" onclick="openTermOfService(this)">Term of Service</a></nobr> <input type="checkbox" onchange="onTermOfServiceCheckboxChange(this)">
                        <button type="submit" class="btn btn-default" disabled id="btn_sign_up" onclick="signUp()">Sign Up</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
