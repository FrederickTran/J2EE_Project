/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.j2ee.BeanForm.sampleActionform;
import com.j2ee.DataTableBridge.ConnectDB;
import org.jboss.weld.event.Status;
import com.j2ee.DataTableBridge.TABLE_DEMO_Bridge;
import java.io.PrintWriter;

/**
 *
 * @author tranminhtuan
 */
public class sampleBeanAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

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
        // Login with ajax
        String accountId=(String)request.getParameter("accountId");
        String password=(String)request.getParameter("password");
        String result = "";
        if (ConnectDB.checkLogin(accountId, password))
        {
            result = SUCCESS;
        }
        else{
            result = FAILURE;
        }
        response.setContentType("text/text;charset=utf-8");
        response.setHeader("cache-control", "no-cache");
        PrintWriter out = response.getWriter();
        out.write(result);
        out.flush();
        return mapping.findForward(SUCCESS);
    }
}
