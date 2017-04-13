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
import com.j2ee.BeanForm.UserActionform;


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
    
    public static ArrayList<UserActionform> getAllUser() throws Exception{
        ArrayList<UserActionform> userList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_USER_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                String accountid = rs.getString("AccountId");
                String password = rs.getString("Password");
                String name = rs.getString("AccountName");
                UserActionform user = new UserActionform();
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
}
