/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.BeanForm;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author ngoct
 */
public class SongActionForm extends org.apache.struts.action.ActionForm {
    
    private int songId;
    private String songName;
    private int musicianId;
    private int singerId;
    private double price;
    private String uploader;
    private String link;
    private FormFile file;
    private String musicianName;
    private String singerName;
    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public int getMusicianId() {
        return musicianId;
    }

    public void setMusicianId(int musicianId) {
        this.musicianId = musicianId;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public FormFile getFile() {
        return file;
    }

    public void setFile(FormFile file) {
        this.file = file;
    }


    public String getMusicianName() {
        return musicianName;
    }

    public void setMusicianName(String musicianName) {
        this.musicianName = musicianName;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
    }
    
    
    
    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    
    /**
     *
     */
    public SongActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getSongName() == null) {
            errors.add("name", new ActionMessage("error.name.required"));
        }
        if( getFile().getFileSize()== 0){
           errors.add("common.file.err",
            new ActionMessage("error.common.file.required"));
           return errors;
        }
        if(getFile().getFileSize() > 10240){ //10kb
           errors.add("common.file.err.size",
                new ActionMessage("error.common.file.size.limit", 10240));
           return errors;
        }
	      
        if(!"media".equals(getFile().getContentType())){
            errors.add("common.file.err.ext",
             new ActionMessage("error.common.file.media.only"));
            return errors;
        }
	    	
        return errors;
    }
}
