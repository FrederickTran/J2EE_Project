/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.BeanForm.MusicianActionForm;
import com.j2ee.BeanForm.SingerActionForm;
import com.j2ee.DataTableBridge.SingerDB;
import com.j2ee.DataTableBridge.SingerDB;
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
public class SingerAdminAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String ADD_EDIT_SINGER_PAGE = "addeditsinger";
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
            List<SingerActionForm> listSingers;
            switch(task){
                case "add":
                    return mapping.findForward(ADD_EDIT_SINGER_PAGE);
                case "edit":
                    int id = Integer.parseInt(request.getParameter("id"));
                    SingerActionForm singer = SingerDB.getById(id);
                    if(singer == null)
                        return mapping.findForward(FAIL);
                    request.setAttribute("singerId", id);
                    request.setAttribute("singer", singer);
                    return mapping.findForward(ADD_EDIT_SINGER_PAGE);
                case "search":
                    String key = request.getParameter("key");
                    listSingers = SingerDB.searchByKey(key);
                    request.setAttribute("listSingers", listSingers);
                    request.setAttribute("totalRecord", listSingers.size());
                    request.setAttribute("numRecord", listSingers.size());
                    request.setAttribute("recordPerPage", listSingers.size());
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
                         listSingers = SingerDB.getAllSinger(SORT_BY_NAME,start, num);
                    else
                        listSingers = SingerDB.getAllSinger(start, num);
                    int total = SingerDB.getCount();
                    request.setAttribute("listSingers", listSingers);
                    request.setAttribute("totalRecord", total);
                    request.setAttribute("numRecord", listSingers.size());
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
            List<SingerActionForm> listSingers;
            listSingers = SingerDB.getAllSinger(0, DEFAULT_NUM_RECORD);
            int total = SingerDB.getCount();
            request.setAttribute("listSingers", listSingers);
            request.setAttribute("totalRecord", total);
            request.setAttribute("numRecord", listSingers.size());
            request.setAttribute("recordPerPage", DEFAULT_NUM_RECORD);
            request.setAttribute("curIndex", 0);
            request.setAttribute("curPage", 1);
            request.setAttribute("sort", false);
            request.setAttribute("maxPage", (total % DEFAULT_NUM_RECORD > 0? 1+(total / DEFAULT_NUM_RECORD) : total / DEFAULT_NUM_RECORD));
        }
        return mapping.findForward(SUCCESS);
    }
}
