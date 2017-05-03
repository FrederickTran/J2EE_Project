<%-- 
    Document   : signupsucessful
    Created on : Apr 28, 2017, 10:05:15 PM
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
        <div id="modal_sign_up_successful" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sign Up Successful</h4>
                    </div>
                    <div class="modal-body">
                        <p style="padding-top: 20px; margin: 0;">Welcome to Rhythms X.<br>
                            Offline Rhythms X is in development, please keep in mind that download and publish songs from Rhytms X with any third party software is violate our
                        <nobr><a href="#" onclick="openTermOfService()">Term of service</a></nobr><br></p>
                        </p>
                    </div>
                    <div class="modal-footer" style="padding-top: 20px">
                        <button type="submit" class="btn btn-default" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
