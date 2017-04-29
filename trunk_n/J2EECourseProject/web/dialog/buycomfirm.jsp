<%-- 
    Document   : buycomfirm
    Created on : Apr 28, 2017, 10:06:27 PM
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
        <div id="modal_buy_confirm" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Buy this song</h4>
                    </div>
                    <div class="modal-body">
                        <p style="padding-top: 20px; margin: 0;">You didn't buy this song, yet. What would you like to do?<br>You currently have: 0 free song(s) left.</p><br>
                        <p style="font-size: medium; font-weight: 600; color: var(--color13);">This song will cost you: $0.32</p>
                        <div style="padding: 10px; margin: 0; border: 1px solid var(--color07); border-radius: 0px;">
                            <p>Your current payment information:</p>
                            <p>Name:</p>
                            <p>Address:</p>
                            <p>Card ID:</p>
                        </div>
                    </div>
                    <div class="modal-footer" style="padding-top: 20px">
                        <button id="btn-buy-this-song" type="submit" class="btn btn-default" data-dismiss="modal">Buy this song</button>
                        <button id="btn-listen-for-second" type="submit" class="btn btn-default" data-dismiss="modal">Listen for 10 seconds</button>
                        <button type="submit" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
