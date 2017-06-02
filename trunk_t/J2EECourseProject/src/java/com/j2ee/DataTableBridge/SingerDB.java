/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

import com.j2ee.BeanForm.SingerActionForm;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ngoct
 */
public class SingerDB {
    public static ArrayList<SingerActionForm> getAllSinger(){
        ArrayList<SingerActionForm> singerList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SingerActionForm singer = new SingerActionForm();
                singer.setSingerId(rs.getInt("SingerId"));
                singer.setSingerName(rs.getString("SingerName"));
                singer.setInfo(rs.getString("Info"));
                singerList.add(singer);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return singerList;
    }
    public static ArrayList<SingerActionForm> getAllSinger(String order, int start, int num){
        ArrayList<SingerActionForm> singerList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_GETAll(?, ?, ?) }");
            cs.setString("Order", order);
            cs.setInt("Start", start);
            cs.setInt("Num", num);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SingerActionForm singer = new SingerActionForm();
                singer.setSingerId(rs.getInt("SingerId"));
                singer.setSingerName(rs.getString("SingerName"));
                singer.setInfo(rs.getString("Info"));
                singerList.add(singer);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return singerList;
    }
    
    public static ArrayList<SingerActionForm> getAllSinger(int start, int num){
        ArrayList<SingerActionForm> singerList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_GETAll(?, ?, ?) }");
            cs.setString("Order", null);
            cs.setInt("Start", start);
            cs.setInt("Num", num);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SingerActionForm singer = new SingerActionForm();
                singer.setSingerId(rs.getInt("SingerId"));
                singer.setSingerName(rs.getString("SingerName"));
                singer.setInfo(rs.getString("Info"));
                singerList.add(singer);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return singerList;
    }
    
    public static ArrayList<SingerActionForm> getAllSinger(String order){
        ArrayList<SingerActionForm> singerList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_GETAll(?) }");
            cs.setString("Order", order);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SingerActionForm singer = new SingerActionForm();
                singer.setSingerId(rs.getInt("SingerId"));
                singer.setSingerName(rs.getString("SingerName"));
                singer.setInfo(rs.getString("Info"));
                singerList.add(singer);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return singerList;
    }
    public static int getCount() {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_GETCOUNT }");
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
    public static ArrayList<SingerActionForm> searchByKey(String key) {
        ArrayList<SingerActionForm> singerList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_SEARCH(?) }");
            cs.setString("Key", key);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SingerActionForm singer = new SingerActionForm();
                singer.setSingerId(rs.getInt("SingerId"));
                singer.setSingerName(rs.getString("SingerName"));
                singer.setInfo(rs.getString("Info"));
                singerList.add(singer);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return singerList;
    }
    public static SingerActionForm getById(int singerId) {
        Connection cn = ConnectDB.getConnect();
        SingerActionForm singer = new SingerActionForm();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_GETBYID(?) }");
            cs.setInt("SingerId", singerId);
            ResultSet rs = cs.executeQuery();
            rs.next();
            singer.setSingerId(rs.getInt("SingerId"));
            singer.setSingerName(rs.getString("SingerName"));
            singer.setInfo(rs.getString("Info"));
            return singer;
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
    }
    public static boolean insertSinger(SingerActionForm singer) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_INS(?, ?) }");
            cs.setString("SingerName", singer.getSingerName());
            cs.setString("Info", singer.getInfo());
            cs.execute();
            return true;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    public static boolean updateSinger(SingerActionForm singer) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_UPD(?, ?, ?) }");
            cs.setInt("SingerId", singer.getSingerId());
            cs.setString("SingerName", singer.getSingerName());
            cs.setString("Info", singer.getInfo());
            cs.execute();
            return true;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    public static int getId(String singerName){
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SINGER_GETID(?) }");
            cs.setString("SingerName", singerName);
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
