package org;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionDAO {
    Connection con;
    public Connection DBConnectionDAO() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj1216", "root", "yeonsik97!");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return con;
    }

}
