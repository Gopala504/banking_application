package banker;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNumber = (String) session.getAttribute("accountnumber");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (accountNumber == null) {
            out.println("<h1>Account number not found in session</h1>");
            return;
        }

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");

            // Get current balance
            String getBalanceQuery = "SELECT balance FROM customers WHERE accountnumber = ?";
            ps = con.prepareStatement(getBalanceQuery);
            ps.setString(1, accountNumber);
            rs = ps.executeQuery();

            if (rs.next()) {
                double currentBalance = rs.getDouble("balance");
                double newBalance = currentBalance + amount;

                // Update balance
                String updateQuery = "UPDATE customers SET balance = ? WHERE accountnumber = ?";
                ps = con.prepareStatement(updateQuery);
                ps.setDouble(1, newBalance);
                ps.setString(2, accountNumber);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<h1>Deposit Successful</h1>");
                    out.println("<p>New Balance: " + newBalance + "</p>");
                    out.println("<a href='deposit.jsp'>Back to Deposit</a>");
                } else {
                    out.println("<h1>Deposit Failed</h1>");
                    out.println("<a href='deposit.jsp'>Back to Deposit</a>");
                }
            } else {
                out.println("<h1>Account Number Not Found</h1>");
                out.println("<a href='deposit.jsp'>Back to Deposit</a>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}