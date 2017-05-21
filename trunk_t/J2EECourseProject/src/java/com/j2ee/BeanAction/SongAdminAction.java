/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.BeanForm.MusicianActionForm;
import com.j2ee.BeanForm.SingerActionForm;
import com.j2ee.BeanForm.SongActionForm;
import com.j2ee.DataTableBridge.MusicianDB;
import com.j2ee.DataTableBridge.SingerDB;
import com.j2ee.DataTableBridge.SongDB;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class SongAdminAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String ADD_EDIT_SONG_PAGE = "addeditsong";
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
            List<SingerActionForm> listSingers;
            switch(task){
                case "delete":
                    int id = Integer.parseInt(request.getParameter("id"));
                    if(SongDB.deleteSong(id))
                        result = SUCCESS;
                    else result = FAIL;
                    response.setContentType("text/text;charset=utf-8");
                    response.setHeader("cache-control", "no-cache");
                    PrintWriter out = response.getWriter();
                    out.write(result);
                    out.flush();
                    return mapping.findForward(NO_FOWARD);
                case "add":
                    listMusicians = MusicianDB.getAllMusician();
                    listSingers = SingerDB.getAllSinger();
                    request.setAttribute("listMusicians", listMusicians);
                    request.setAttribute("listSingers", listSingers);
                    return mapping.findForward(ADD_EDIT_SONG_PAGE);
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    listMusicians = MusicianDB.getAllMusician();
                    listSingers = SingerDB.getAllSinger();
                    SongActionForm song = SongDB.getById(id);
                    String link = song.getLink();
                    if(link != null){
                        String filename = link.substring(7);
                        request.setAttribute("filename", filename);
                    }
                    if(song == null)
                        return mapping.findForward(NO_FOWARD);
                    request.setAttribute("listMusicians", listMusicians);
                    request.setAttribute("listSingers", listSingers);
                    request.setAttribute("songId", id);
                    request.setAttribute("song", song);
                    return mapping.findForward(ADD_EDIT_SONG_PAGE);
                case "search":
                    String key = request.getParameter("key");
                    List<SongActionForm> listSongs;
                    listSongs = SongDB.searchByKey(key);
                    request.setAttribute("listSongs", listSongs);
                    request.setAttribute("totalRecord", listSongs.size());
                    request.setAttribute("numRecord", listSongs.size());
                    request.setAttribute("recordPerPage", listSongs.size());
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
                         listSongs = SongDB.getAllSong(SORT_BY_NAME,start, num);
                    else
                        listSongs = SongDB.getAllSong(start, num);
                    int total = SongDB.getCount();
                    request.setAttribute("listSongs", listSongs);
                    request.setAttribute("totalRecord", total);
                    request.setAttribute("numRecord", listSongs.size());
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
            List<SongActionForm> listSongs;
            listSongs = SongDB.getAllSong(0, DEFAULT_NUM_RECORD);
            int total = SongDB.getCount();
            request.setAttribute("listSongs", listSongs);
            request.setAttribute("totalRecord", total);
            request.setAttribute("numRecord", listSongs.size());
            request.setAttribute("recordPerPage", DEFAULT_NUM_RECORD);
            request.setAttribute("curIndex", 0);
            request.setAttribute("curPage", 1);
            request.setAttribute("sort", false);
            request.setAttribute("maxPage", (total % DEFAULT_NUM_RECORD > 0? 1+(total / DEFAULT_NUM_RECORD) : total / DEFAULT_NUM_RECORD));
        }
        return mapping.findForward(SUCCESS);
    }
}
