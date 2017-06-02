/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.BeanForm.SongActionForm;
import com.j2ee.BeanForm.UserActionForm;
import com.j2ee.DataTableBridge.SongDB;
import com.j2ee.DataTableBridge.UserDB;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ngoct
 */
public class WelcomeAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

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
        String songId = request.getParameter("id");
        if(songId != null){
            int id = Integer.parseInt(songId);
            SongActionForm song = SongDB.getById(id);
            if(song != null)
                request.setAttribute("song", song);
        }
        Cookie[] rqck = request.getCookies();
        if(rqck != null){
            if(rqck.length > 0){
                for(int i = 0; i < rqck.length; i++){
                    if(rqck[i].getName().equals("username")){
                        String account = rqck[i].getValue();
                        UserActionForm user = UserDB.getById(account);
                        request.setAttribute("user", user);
                        break;
                    }
                }
            }
        }
        return mapping.findForward(SUCCESS);
    }
}
