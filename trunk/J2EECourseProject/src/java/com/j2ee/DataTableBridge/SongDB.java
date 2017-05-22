/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.j2ee.DataTableBridge;

import com.j2ee.BeanForm.SongActionForm;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ngoct
 */
public class SongDB {
    public static ArrayList<SongActionForm> getAllSong(String order, int start, int num){
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_GETAll(?, ?, ?) }");
            cs.setString("Order", order);
            cs.setInt("Start", start);
            cs.setInt("Num", num);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SongActionForm song = new SongActionForm();
                song.setSongId(rs.getInt("SongId"));
                song.setSongName(rs.getString("SongName"));
                song.setMusicianId(rs.getInt("MusicianId"));
                song.setMusicianName(rs.getString("MusicianName"));
                song.setSingerId(rs.getInt("SingerId"));
                song.setSingerName(rs.getString("SingerName"));
                song.setPrice(rs.getDouble("Price"));
                song.setUploader(rs.getString("AccountName"));
                song.setLink(rs.getString("Link"));
                songList.add(song);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return songList;
    }
    
    public static ArrayList<SongActionForm> getAllSong(int start, int num){
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_GETAll(?, ?, ?) }");
            cs.setString("Order", null);
            cs.setInt("Start", start);
            cs.setInt("Num", num);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SongActionForm song = new SongActionForm();
                song.setSongId(rs.getInt("SongId"));
                song.setSongName(rs.getString("SongName"));
                song.setMusicianId(rs.getInt("MusicianId"));
                song.setMusicianName(rs.getString("MusicianName"));
                song.setSingerId(rs.getInt("SingerId"));
                song.setSingerName(rs.getString("SingerName"));
                song.setPrice(rs.getDouble("Price"));
                song.setUploader(rs.getString("AccountName"));
                song.setLink(rs.getString("Link"));
                songList.add(song);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return songList;
    }
    
    public static ArrayList<SongActionForm> getAllSong(String order){
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_GETAll(?) }");
            cs.setString("Order", order);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SongActionForm song = new SongActionForm();
                song.setSongId(rs.getInt("SongId"));
                song.setSongName(rs.getString("SongName"));
                song.setMusicianId(rs.getInt("MusicianId"));
                song.setMusicianName(rs.getString("MusicianName"));
                song.setSingerId(rs.getInt("SingerId"));
                song.setSingerName(rs.getString("SingerName"));
                song.setPrice(rs.getDouble("Price"));
                song.setUploader(rs.getString("AccountName"));
                song.setLink(rs.getString("Link"));
                songList.add(song);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return songList;
    }
    
    public static ArrayList<SongActionForm> getAllSong(){
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_GETAll }");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SongActionForm song = new SongActionForm();
                song.setSongId(rs.getInt("SongId"));
                song.setSongName(rs.getString("SongName"));
                song.setMusicianId(rs.getInt("MusicianId"));
                song.setMusicianName(rs.getString("MusicianName"));
                song.setSingerId(rs.getInt("SingerId"));
                song.setSingerName(rs.getString("SingerName"));
                song.setPrice(rs.getDouble("Price"));
                song.setUploader(rs.getString("AccountName"));
                song.setLink(rs.getString("Link"));
                songList.add(song);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return songList;
    }
    
    public static ArrayList<SongActionForm> searchByKey(String key) {
        ArrayList<SongActionForm> songList = new ArrayList();
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_SEARCH(?) }");
            cs.setString("Key", key);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                SongActionForm song = new SongActionForm();
                song.setSongId(rs.getInt("SongId"));
                song.setSongName(rs.getString("SongName"));
                song.setMusicianId(rs.getInt("MusicianId"));
                song.setMusicianName(rs.getString("MusicianName"));
                song.setSingerId(rs.getInt("SingerId"));
                song.setSingerName(rs.getString("SingerName"));
                song.setPrice(rs.getDouble("Price"));
                song.setUploader(rs.getString("AccountName"));
                song.setLink(rs.getString("Link"));
                songList.add(song);
            }
            
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
        return songList;
    }
    public static boolean insertSong(SongActionForm song) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_INS(?, ?, ?, ?, ?, ?, ?) }");
            cs.setString("SongName", song.getSongName());
            cs.setInt("MusicianId", song.getMusicianId());
            cs.setInt("SingerId", song.getSingerId());
            cs.setDouble("Price", song.getPrice());
            cs.setString("Link", song.getLink());
            cs.setString("UploaderId", song.getUploader());
            cs.setBoolean("DeleteFlag", false);
            cs.execute();
            return true;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    public static boolean updateSong(SongActionForm song) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_UPD(?, ?, ?, ?, ?, ?) }");
            cs.setInt("SongId", song.getSongId());
            cs.setString("SongName", song.getSongName());
            cs.setInt("MusicianId", song.getMusicianId());
            cs.setInt("SingerId", song.getSingerId());
            cs.setDouble("Price", song.getPrice());
            cs.setString("Link", song.getLink());
            cs.execute();
            return true;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    public static boolean deleteSong(int id) {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_DEL(?) }");
            cs.setInt("SongId", id);
            cs.execute();
            return true;
        } catch (SQLException ex) {
        }
        finally{
            ConnectDB.Close();
        }
        return false;
    }
    
    public static int getCount() {
        Connection cn = ConnectDB.getConnect();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_GETCOUNT }");
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
    
    public static SongActionForm getById(int songId) {
        Connection cn = ConnectDB.getConnect();
        SongActionForm song = new SongActionForm();
        try {
            CallableStatement cs = cn.prepareCall("{ call SP_SONG_GETBYID(?) }");
            cs.setInt("SongId", songId);
            ResultSet rs = cs.executeQuery();
            rs.next();
            song.setSongId(rs.getInt("SongId"));
            song.setSongName(rs.getString("SongName"));
            song.setMusicianId(rs.getInt("MusicianId"));
            song.setMusicianName(rs.getString("MusicianName"));
            song.setSingerId(rs.getInt("SingerId"));
            song.setSingerName(rs.getString("SingerName"));
            song.setPrice(rs.getDouble("Price"));
            song.setUploader(rs.getString("AccountName"));
            song.setLink(rs.getString("Link"));
            return song;
        } catch (SQLException ex) {
            return null;
        }
        finally{
            ConnectDB.Close();
        }
    }
}
