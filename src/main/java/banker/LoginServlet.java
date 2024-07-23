package banker;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/bank";
    private String dbUser = "root";
    private String dbPassword = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountnumber");
        String password = request.getParameter("password");

        if (accountNumber == null || accountNumber.isEmpty() || password == null || password.isEmpty()) {
            response.getWriter().println("Account number or password is null or empty. Please provide valid credentials.");
            return;
        }

        String sql = "SELECT temppassword FROM customers WHERE accountnumber = ? AND password = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountNumber);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String tempPasswordFlag = resultSet.getString("temppassword");
                HttpSession session = request.getSession();
                session.setAttribute("accountnumber", accountNumber);  // Set the account number in the session

                if ("1".equals(tempPasswordFlag)) {
                    response.sendRedirect("cnfmpass.jsp");
                } else {
                    response.sendRedirect("done.jsp");
                }
            } else {
                response.getWriter().println("Invalid account number or password. Please try again.");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
