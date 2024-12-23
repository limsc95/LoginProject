package org;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
//import java.sql.DriverManager;

public class DBConnectionDAO {
    Connection con;
    public Connection DBConnectionDAO() {

        try {
            Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            //java:/comp/env: 웹 서버의 환경설정 디렉토리
            DataSource ds=(DataSource)envContext.lookup("jdbc/test");
            con=ds.getConnection(); //연결객체 가져오기.

            // 기존 방식
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://223.130.132.189:3306/test", "test", "1234");
//            System.out.println("성공");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return con;
    }

}
