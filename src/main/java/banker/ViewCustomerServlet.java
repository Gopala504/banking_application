package banker;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ViewCustomerServlet")
public class ViewCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect("CustomerDetails.jsp");
            return;
        }

        int customerId = (int) session.getAttribute("customerId");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DatabaseUtil.getConnection();

            String query = "SELECT fullname, idproof, mobilenumber, gender, typeofaccount, initialdeposit, balance, dateOfBirth, email FROM customers WHERE customerId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, customerId);
            rs = ps.executeQuery();

            if (rs.next()) {
                Customer customer = new Customer();
                customer.setFullName(rs.getString("fullname"));
                customer.setIdProof(rs.getString("idproof"));
                customer.setMobileNumber(rs.getString("mobilenumber"));
                customer.setGender(rs.getString("gender"));
                customer.setTypeOfAccount(rs.getString("typeofaccount"));
                customer.setInitialDeposit(rs.getDouble("initialdeposit"));
                customer.setBalance(rs.getDouble("balance"));
                customer.setDateOfBirth(rs.getString("dateOfBirth"));
                customer.setEmail(rs.getString("email"));

                request.setAttribute("customer", customer);
                request.getRequestDispatcher("customerDetails.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No customer details found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
