/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

import com.j2ee.BeanForm.MusicianActionForm;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ngoct
 */
public class MusicianDB {
    public static ArrayList<MusicianActionForm> getAllMusician(){
        ArrayList<MusicianActionForm> musicianList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                MusicianActionForm musician = new MusicianActionForm();
                musician.setMusicianId(rs.getInt("MusicianId"));
                musician.setMusicianName(rs.getString("MusicianName"));
                musician.setInfo(rs.getString("Info"));
                musicianList.add(musician);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return musicianList;
    }
    public static int getId(String musicianName){
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_GETID(?) }");
            cs.setString("MusicianName", musicianName);
            ResultSet rs = cs.executeQuery();
            rs.next();
            int id = rs.getInt(1);
            return id;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return -1;
    }
}
