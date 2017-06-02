/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.BeanForm.MusicianActionForm;
import com.j2ee.DataTableBridge.MusicianDB;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ngoct
 */
public class MusicianAdminAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String ADD_EDIT_MUSICIAN_PAGE = "addeditmusician";
    private static final String NO_FOWARD = "nofoward";
    private static final String SORT_BY_NAME = "name";
    private static final int DEFAULT_NUM_RECORD = 5;
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
        String task = request.getParameter("task");
        if(task != null){
            List<MusicianActionForm> listMusicians;
            switch(task){
                case "add":
                    return mapping.findForward(ADD_EDIT_MUSICIAN_PAGE);
                case "edit":
                    int id = Integer.parseInt(request.getParameter("id"));
                    MusicianActionForm musician = MusicianDB.getById(id);
                    if(musician == null)
                        return mapping.findForward(NO_FOWARD);
                    request.setAttribute("musicianId", id);
                    request.setAttribute("musician", musician);
                    return mapping.findForward(ADD_EDIT_MUSICIAN_PAGE);
                case "search":
                    String key = request.getParameter("key");
                    listMusicians = MusicianDB.searchByKey(key);
                    request.setAttribute("listMusicians", listMusicians);
                    request.setAttribute("totalRecord", listMusicians.size());
                    request.setAttribute("numRecord", listMusicians.size());
                    request.setAttribute("recordPerPage", listMusicians.size());
                    request.setAttribute("curIndex", 0);
                    request.setAttribute("curPage", 1);
                    request.setAttribute("maxPage", 1);
                    request.setAttribute("sort", false);
                    request.setAttribute("key", key);
                    break;
                case "retrieve":
                    int page = Integer.parseInt(request.getParameter("page"));
                    int num = Integer.parseInt(request.getParameter("num"));
                    boolean sort = Boolean.parseBoolean(request.getParameter("sort"));
                    int start = num * (page - 1);
                    if(sort)
                         listMusicians = MusicianDB.getAllMusician(SORT_BY_NAME,start, num);
                    else
                        listMusicians = MusicianDB.getAllMusician(start, num);
                    int total = MusicianDB.getCount();
                    request.setAttribute("listMusicians", listMusicians);
                    request.setAttribute("totalRecord", total);
                    request.setAttribute("numRecord", listMusicians.size());
                    request.setAttribute("recordPerPage", num);
                    request.setAttribute("curIndex", start);
                    request.setAttribute("curPage", (start / num) + 1);
                    request.setAttribute("maxPage", (total % num > 0? 1+(total / num) : total / num));
                    request.setAttribute("sort", sort);
                    break;
                default:
                    return mapping.findForward(FAIL);
            }
        }else{
            List<MusicianActionForm> listMusicians;
            listMusicians = MusicianDB.getAllMusician(0, DEFAULT_NUM_RECORD);
            int total = MusicianDB.getCount();
            request.setAttribute("listMusicians", listMusicians);
            request.setAttribute("totalRecord", total);
            request.setAttribute("numRecord", listMusicians.size());
            request.setAttribute("recordPerPage", DEFAULT_NUM_RECORD);
            request.setAttribute("curIndex", 0);
            request.setAttribute("curPage", 1);
            request.setAttribute("sort", false);
            request.setAttribute("maxPage", (total % DEFAULT_NUM_RECORD > 0? 1+(total / DEFAULT_NUM_RECORD) : total / DEFAULT_NUM_RECORD));
        }
        return mapping.findForward(SUCCESS);
    }
}
