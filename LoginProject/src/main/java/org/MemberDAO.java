package org;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    Connection con;
    PreparedStatement psmt;
    ResultSet rs;
    DBConnectionDAO dbc = new DBConnectionDAO();

    public void insertMember(MemberBean mBean) throws SQLException {
        con= dbc.DBConnectionDAO();
        String sql="insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
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
    public int idCheck(String id) throws SQLException {
        con= dbc.DBConnectionDAO();
        String sql="SELECT COUNT(*) AS cnt FROM member WHERE id = ?";
        int exist=0;
        try {
            psmt=con.prepareStatement(sql);
            psmt.setString(1, id);
            rs=psmt.executeQuery();
            if(rs.next()){
                exist=rs.getInt("cnt");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return exist;
    }
    public MemberBean loginMember(String id, String pwd) throws SQLException {
        MemberBean mBean=new MemberBean();
        try {
            con = dbc.DBConnectionDAO();
            String sql = "select * from member where id=? and pwd1=?";
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
