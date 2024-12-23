package org;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MemberDAO {
    Connection con;
    PreparedStatement psmt;
    ResultSet rs;
    DBConnectionDAO dbc = new DBConnectionDAO();

    public void insertMember(MemberBean mBean) throws SQLException {
        con= dbc.DBConnectionDAO();
        String sql="insert into members values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            psmt=con.prepareStatement(sql);
            psmt.setString(1, mBean.getId());
            psmt.setString(2, mBean.getPwd1());
            psmt.setString(3, mBean.getPwd2());
            psmt.setString(4, mBean.getName());
            psmt.setString(5, mBean.getGender());
            psmt.setString(6, mBean.getEmail());
            psmt.setString(7, mBean.getBirth());
            psmt.setString(8, mBean.getZipcode());
            psmt.setString(9, mBean.getAddress());
            psmt.setString(10, mBean.getHobby());
            psmt.setString(11, mBean.getJob());
            psmt.executeUpdate();
            psmt.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        con.close();
    }
    public String idCheck(String id) throws SQLException {
        con= dbc.DBConnectionDAO();
        String sql="select * from members where id=?";
        String exist="";
        try {
            psmt=con.prepareStatement(sql);
            psmt.setString(1, id);
            rs=psmt.executeQuery();
            if(rs.next()){
                exist=rs.getString("id");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return exist;
    }
    public Vector<ZipBean> getZipList(String area) throws SQLException {
        Vector vec=new Vector();

        try {
            con = dbc.DBConnectionDAO();
            String sql = "select * from tblzipcode where area2 like = ? or area3 = ? order by zipcode asc";
            psmt = con.prepareStatement(sql);
            String areaPattern = area + "%";

            psmt.setString(1, areaPattern);
            psmt.setString(2, areaPattern);
            rs = psmt.executeQuery();

            while (rs.next()) {
                ZipBean zbBean = new ZipBean();
                zbBean.setZipcode(rs.getString("zipcode"));
                zbBean.setArea1(rs.getString("area1"));
                zbBean.setArea2(rs.getString("area2"));
                zbBean.setArea3(rs.getString("area3"));
                vec.add(zbBean);
            }
            rs.close();
            psmt.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        con.close();
        return vec;
    }
    public MemberBean loginMember(String id, String pwd) throws SQLException {
        MemberBean mBean=new MemberBean();
        try {
            con = dbc.DBConnectionDAO();
            String sql = "select * from members where id=? and pwd=?";
            psmt=con.prepareStatement(sql);
            psmt.setString(1, id);
            psmt.setString(2, pwd);
            rs=psmt.executeQuery();
            if(rs.next()){
                mBean.setId(rs.getString("id"));
                mBean.setPwd1(rs.getString("pwd1"));
            }
            rs.close();
            psmt.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        con.close();
        return mBean;
    }


}
