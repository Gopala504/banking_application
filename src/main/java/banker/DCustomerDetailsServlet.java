package banker;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DCustomerDetailsServlet")
public class DCustomerDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        String accountNumber = request.getParameter("accountNumber");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM customers WHERE account_number = ?");
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setFullName(rs.getString("full_name"));
                customer.setIdProof(rs.getString("id_proof"));
                customer.setDateOfBirth(rs.getString("date_of_birth"));
                customer.setEmail(rs.getString("email"));
                customer.setMobileNumber(rs.getString("mobile_number"));
                customer.setGender(rs.getString("gender"));
                customer.setTypeOfAccount(rs.getString("type_of_account"));
                customer.setBalance(rs.getDouble("balance"));
                customers.add(customer);
            }

            request.setAttribute("customers", customers);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("DCustomerDetails.jsp").forward(request, response);
    }
}
