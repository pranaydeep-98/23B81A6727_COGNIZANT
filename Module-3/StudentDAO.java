import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class StudentDAO {

    private static final String URL =
            "jdbc:mysql://localhost:3306/studentdb";

    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public void insertStudent(int id, String name)
            throws Exception {

        Connection con =
                DriverManager.getConnection(URL, USER, PASSWORD);

        String query =
                "insert into students(id,name) values(?,?)";

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setInt(1, id);
        ps.setString(2, name);

        ps.executeUpdate();

        con.close();
    }

    public void updateStudent(int id, String name)
            throws Exception {

        Connection con =
                DriverManager.getConnection(URL, USER, PASSWORD);

        String query =
                "update students set name=? where id=?";

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setString(1, name);
        ps.setInt(2, id);

        ps.executeUpdate();

        con.close();
    }
}