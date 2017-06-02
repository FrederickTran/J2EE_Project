/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanAction;

import com.j2ee.BeanForm.MusicianActionForm;
import com.j2ee.BeanForm.SingerActionForm;
import com.j2ee.BeanForm.SongActionForm;
import com.j2ee.BeanForm.UserActionForm;
import com.j2ee.DataTableBridge.MusicianDB;
import com.j2ee.DataTableBridge.SingerDB;
import com.j2ee.DataTableBridge.SongDB;
import com.j2ee.DataTableBridge.UserDB;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author ngoct
 */
public class UserUploadAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String UPLOAD = "upload";
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String DEFAULT_UPLOAD_FOLDER = "upload\\";

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
        
        SongActionForm f = (SongActionForm)form;
        if(f.getSongName() != null){
            FormFile file = f.getFile();
            //Get the servers upload directory real path name
            String filePath = getServlet().getServletContext().getRealPath("/") +"upload";
            //create the upload folder if not exists
            File folder = new File(filePath);
            if(!folder.exists()){
                folder.mkdir();
            }
            String fileName = file.getFileName();
            if(!("").equals(fileName)){  
                System.out.println("Server path:" +filePath);
                File newFile = new File(filePath, fileName);
                if(!newFile.exists()){
                  FileOutputStream fos = new FileOutputStream(newFile);
                  fos.write(file.getFileData());
                  fos.flush();
                  fos.close();
                }  
            }
            int musicianId = MusicianDB.getId(f.getMusicianName());
            int singerId = SingerDB.getId(f.getSingerName());
            if(musicianId < 0 || singerId < 0)
                return mapping.findForward(FAIL);
            SongActionForm song = new SongActionForm();
            song.setSongName(f.getSongName());
            song.setMusicianId(musicianId);
            song.setSingerId(singerId);
            song.setLink(DEFAULT_UPLOAD_FOLDER+fileName);
            song.setPrice(f.getPrice());
            Cookie[] rqck = request.getCookies();
            if(rqck != null){
                if(rqck.length > 0){
                    for(int i = 0; i < rqck.length; i++){
                        if(rqck[i].getName().equals("username")){
                            song.setUploader(rqck[i].getValue());
                            break;
                        }
                    }
                }
            }
            if(SongDB.insertSong(song))
                return mapping.findForward(SUCCESS);
            return mapping.findForward(FAIL);
        }
        else{
            List<MusicianActionForm> listMusicians;
            List<SingerActionForm> listSingers;
            listMusicians = MusicianDB.getAllMusician();
            listSingers = SingerDB.getAllSinger();
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
            request.setAttribute("listMusicians", listMusicians);
            request.setAttribute("listSingers", listSingers);
            return mapping.findForward(UPLOAD);
        }
    }
}
