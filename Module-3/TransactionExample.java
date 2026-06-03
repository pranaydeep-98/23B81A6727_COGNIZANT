import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class TransactionExample {

    static void transfer(
            int fromId,
            int toId,
            double amount) throws Exception {

        Connection con =
                DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/bank",
                        "root",
                        "root"
                );

        con.setAutoCommit(false);

        try {

            PreparedStatement debit =
                    con.prepareStatement(
                            "update accounts set balance=balance-? where id=?");

            debit.setDouble(1, amount);
            debit.setInt(2, fromId);
            debit.executeUpdate();

            PreparedStatement credit =
                    con.prepareStatement(
                            "update accounts set balance=balance+? where id=?");

            credit.setDouble(1, amount);
            credit.setInt(2, toId);
            credit.executeUpdate();

            con.commit();

        } catch (Exception e) {
            con.rollback();
        }

        con.close();
    }

    public static void main(String[] args) throws Exception {
        transfer(1, 2, 500);
    }
}