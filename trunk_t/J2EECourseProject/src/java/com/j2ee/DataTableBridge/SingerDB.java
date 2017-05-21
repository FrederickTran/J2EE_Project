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
