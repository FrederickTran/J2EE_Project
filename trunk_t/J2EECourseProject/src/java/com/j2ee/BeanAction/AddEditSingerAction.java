/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.BeanForm.SingerActionForm;
import com.j2ee.DataTableBridge.SingerDB;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ngoct
 */
public class AddEditSingerAction extends org.apache.struts.action.Action {

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
        
        SingerActionForm singer = (SingerActionForm)form;
        int musicianId = singer.getSingerId();
        if(musicianId > 0){
            if(SingerDB.updateSinger(singer))
                return mapping.findForward(SUCCESS);
            return mapping.findForward(FAIL);
        }else{
            if(SingerDB.insertSinger(singer))
                return mapping.findForward(SUCCESS);
            return mapping.findForward(FAIL);
        }
    }
}
