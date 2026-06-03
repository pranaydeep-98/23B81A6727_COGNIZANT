import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcConnection {
    public static void main(String[] args) throws Exception {

        String url = "jdbc:mysql://localhost:3306/studentdb";
        String user = "root";
        String password = "root";

        Connection con =
                DriverManager.getConnection(url, user, password);

        Statement st = con.createStatement();

        ResultSet rs =
                st.executeQuery("select * from students");

        while (rs.next()) {
            System.out.println(
                    rs.getInt("id") + " " +
                    rs.getString("name")
            );
        }

        con.close();
    }
}