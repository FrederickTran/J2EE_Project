/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.DataTableBridge.CommentDB;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author NguyenPC
 */
public class CommentAction extends org.apache.struts.action.Action {

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
        
        String result ="";
        String comment = (String)request.getParameter("comment");
        String accountId = (String)request.getParameter("accountId");
        String songId = (String)request.getParameter("songId");
        Date timeStam=new Date(System.currentTimeMillis());
        
        if(CommentDB.comment(comment,accountId,songId)){
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
