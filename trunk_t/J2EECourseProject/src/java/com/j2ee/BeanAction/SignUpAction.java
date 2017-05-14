/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.BeanForm.SignUpActionForm;
import com.j2ee.DataTableBridge.UserDB;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ngoct
 */
public class SignUpAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String result = "";
        String accountId = (String)request.getParameter("accountId");
        String accountName = (String)request.getParameter("accountName");
        String password = (String)request.getParameter("password");
        
        String name = (String)request.getParameter("name");
        String addressLine1 = (String)request.getParameter("addressLine1");
        String addressLine2 = (String)request.getParameter("addressLine2");
        String addressZip = (String)request.getParameter("addressZip");
        String addressCountry = (String)request.getParameter("addressCountry");
        
        String cardNumber = (String)request.getParameter("cardNumber");
        String cvvCode = (String)request.getParameter("cvvCode");
        String expiration = (String)request.getParameter("expiration");
        if(UserDB.signUp(accountId, password, accountName, name, addressLine1, addressLine2, addressZip, addressCountry, cardNumber, cvvCode, expiration)){
            result = SUCCESS;
        }
        else{
            result = FAIL;
        }
        response.setContentType("text/text;charset=utf-8");
        response.setHeader("cache-control", "no-cache");
        PrintWriter out = response.getWriter();
        out.write(result);
        out.flush();
        return mapping.findForward(SUCCESS);
    }
}
