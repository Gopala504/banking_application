package banker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    public static Customer getCustomerById(int customerId) throws SQLException {
        String query = "SELECT fullname, idproof, dateOfBirth, email, mobilenumber, gender, typeofaccount, initialdeposit, balance FROM customers WHERE customerId = ?";
        try (Connection con = DatabaseUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Customer customer = new Customer();
                    customer.setFullName(rs.getString("fullname"));
                    customer.setIdProof(rs.getString("idproof"));
                    customer.setDateOfBirth(rs.getString("dateOfBirth"));
                    customer.setEmail(rs.getString("email"));
                    customer.setMobileNumber(rs.getString("mobilenumber"));
                    customer.setGender(rs.getString("gender"));
                    customer.setTypeOfAccount(rs.getString("typeofaccount"));
                    customer.setInitialDeposit(rs.getDouble("initialdeposit"));
                    customer.setBalance(rs.getDouble("balance"));
                    return customer;
                }
            }
        }
        return null;
    }
}
