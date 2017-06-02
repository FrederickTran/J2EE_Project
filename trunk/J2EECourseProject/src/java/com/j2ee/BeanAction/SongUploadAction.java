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
import com.j2ee.BeanForm.SongUploadActionForm;
import java.io.File;
import java.io.FileOutputStream;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author tranminhtuan
 */
public class SongUploadAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String ERROR = "error";
    private static final String StoragePath = "..//songs//";

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
        SongUploadActionForm parsedForm = (SongUploadActionForm)form;
        ActionErrors errors = new ActionErrors();
        errors = parsedForm.validate(mapping, request);
        if (!errors.isEmpty())
        {
            saveErrors(request, errors);
            return mapping.findForward(ERROR);
        }
        else
        {
            try
            {
                FormFile dataFile = parsedForm.getFileData();
                String filePath = StoragePath + "demo.mp3";
                int fileSize = dataFile.getFileSize();
                byte[] fileData = dataFile.getFileData();
                File file = new File(filePath);
                // No need the check existance mkdirs handled it inside the method
                // No exception are threw also
                new File(StoragePath).mkdirs();
                
                FileOutputStream outStream = new FileOutputStream(file);
                String thePath = file.getAbsolutePath();
                System.out.println(thePath);
                outStream.write(fileData, 0, fileSize);
                outStream.flush();
                outStream.close();
            }
            catch (Exception ex)
            {
                errors.add(ActionErrors.GLOBAL_MESSAGE, new ActionMessage("error.UploadPhase", ex.toString()));
                saveErrors(request, errors);
                return mapping.findForward(ERROR);
            }
        }
        
        return mapping.findForward(SUCCESS);
    }
}
