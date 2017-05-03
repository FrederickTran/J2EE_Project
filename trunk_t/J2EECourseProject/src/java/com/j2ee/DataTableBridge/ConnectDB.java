/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

import com.j2ee.BeanForm.SongActionForm;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.j2ee.BeanForm.sampleActionform;
import java.sql.Date;



/**
 *
 * @author ngoct
 */
public class ConnectDB {
    public static Connection cn;
    public static Connection getConnect(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url = "jdbc:sqlserver://localhost:1433; DatabaseName=MusicWebsite";
        String user = "sa";
        String pass = "123456";
        try {
            cn = DriverManager.getConnection(url, user, pass);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cn;
    }
    
    public static void Close(){
        try {
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList<sampleActionform> getAllUser() throws Exception{
        ArrayList<sampleActionform> userList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                String accountid = rs.getString("AccountId");
                String password = rs.getString("Password");
                String name = rs.getString("AccountName");
                sampleActionform user = new sampleActionform();
                user.setAccountID(accountid);
                user.setPassword(password);
                userList.add(user);
            }
        } catch (SQLException ex) {
            throw ex;
        }
        finally{
            ConnectDB.Close();
        }
        return userList;
    }
    
    public static ArrayList<SongActionForm> getAllSong() throws Exception{
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Integer id = rs.getInt("SongId");
                String name = rs.getString("SongName");
                String musician = rs.getString("MusicianName");
                double price = rs.getDouble("Price");
                SongActionForm song = new SongActionForm();
                song.setSongId(id);
                song.setSongName(name);
                song.setMusician(musician);
                song.setPrice(price);
                songList.add(song);
            }
            
        } catch (SQLException ex) {
            throw ex;
        }
        finally{
            ConnectDB.Close();
        }
        return songList;
    }
    public static ArrayList<SongActionForm> searchByKey(String key) throws Exception{
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_SEARCH(?) }");
            cs.setString("Key", key);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Integer id = rs.getInt("SongId");
                String name = rs.getString("SongName");
                String musician = rs.getString("MusicianName");
                double price = rs.getDouble("Price");
                SongActionForm song = new SongActionForm();
                song.setSongId(id);
                song.setSongName(name);
                song.setMusician(musician);
                song.setPrice(price);
                songList.add(song);
            }
            
        } catch (SQLException ex) {
            throw ex;
        }
        finally{
            ConnectDB.Close();
        }
        return songList;
    }
    
    public static boolean checkLogin(String accountId, String password) throws Exception{
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_VALIDATE(?, ?) }");
            cs.setString("AccountId", accountId);
            cs.setString("Password", password);
            ResultSet rs = cs.executeQuery();
            rs.next();
            Integer id = rs.getInt(1);
            if(id == 1)
                return true;
        } catch (SQLException ex) {
            throw ex;
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    
    public static boolean signUp(String accountId, String password, String accountName, String name, String addressLine1, String addressLine2, String addressZip, String addressCountry, String cardNumber, String cvvCode, String expiration) throws Exception{
        ArrayList<SongActionForm> songList = new ArrayList();
        String d[] = expiration.split("-");
        int year = Integer.parseInt("1"+d[0]);
        int month = Integer.parseInt(d[1]);
        Date date = new Date(year, month - 1, 1);
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_INSERT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
            cs.setString("AccountId", accountId);
            cs.setString("Password", password);
            cs.setString("AccountName", accountName);
            cs.setString("Name", name);
            cs.setString("AddressLine1", addressLine1);
            cs.setString("AddressLine2", addressLine2);
            cs.setString("AddressZip", addressZip);
            cs.setString("AddressCountry", addressCountry);
            cs.setString("CardNumber", cardNumber);
            cs.setString("CvvCode", cvvCode);
            cs.setDate("Expiration", date);
            int rs = cs.executeUpdate();
            if(rs == 1){
                return true;
            }
        } catch (SQLException ex) {
            throw ex;
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
}
