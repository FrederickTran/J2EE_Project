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
    public static ArrayList<MusicianActionForm> getAllMusician(String order, int start, int num){
        ArrayList<MusicianActionForm> musicianList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_GETAll(?, ?, ?) }");
            cs.setString("Order", order);
            cs.setInt("Start", start);
            cs.setInt("Num", num);
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
    
    public static ArrayList<MusicianActionForm> getAllMusician(int start, int num){
        ArrayList<MusicianActionForm> musicianList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_GETAll(?, ?, ?) }");
            cs.setString("Order", null);
            cs.setInt("Start", start);
            cs.setInt("Num", num);
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
    
    public static ArrayList<MusicianActionForm> getAllMusician(String order){
        ArrayList<MusicianActionForm> musicianList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_GETAll(?) }");
            cs.setString("Order", order);
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
    public static int getCount() {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_GETCOUNT }");
            ResultSet rs = cs.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            return count;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return -1;
    }
    public static ArrayList<MusicianActionForm> searchByKey(String key) {
        ArrayList<MusicianActionForm> musicianList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_SEARCH(?) }");
            cs.setString("Key", key);
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
    public static MusicianActionForm getById(int songId) {
        Connection cn = ConnectDB.getConnect();
        MusicianActionForm musician = new MusicianActionForm();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_GETBYID(?) }");
            cs.setInt("MusicianId", songId);
            ResultSet rs = cs.executeQuery();
            rs.next();
            musician.setMusicianId(rs.getInt("MusicianId"));
            musician.setMusicianName(rs.getString("MusicianName"));
            musician.setInfo(rs.getString("Info"));
            return musician;
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
    }
    public static boolean insertMusician(MusicianActionForm musician) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_INS(?, ?) }");
            cs.setString("MusicianName", musician.getMusicianName());
            cs.setString("Info", musician.getInfo());
            cs.execute();
            return true;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    public static boolean updateMusician(MusicianActionForm musician) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_MUSICIAN_UPD(?, ?, ?) }");
            cs.setInt("MusicianId", musician.getMusicianId());
            cs.setString("MusicianName", musician.getMusicianName());
            cs.setString("Info", musician.getInfo());
            cs.execute();
            return true;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return false;
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
