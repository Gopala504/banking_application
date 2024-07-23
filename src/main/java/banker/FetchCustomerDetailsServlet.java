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

@WebServlet("/FetchCustomerDetailsServlet")
public class FetchCustomerDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/bank";
    private String dbUser = "root";
    private String dbPassword = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountnumber");

        String fetchDetailsSQL = "SELECT * FROM customers WHERE accountnumber = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            PreparedStatement statement = connection.prepareStatement(fetchDetailsSQL);
            statement.setString(1, accountNumber);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                boolean isActive = resultSet.getBoolean("active");
                if (!isActive) {
                    response.getWriter().println(" account is inactive.");
                } else {
                    request.setAttribute("accountnumber", resultSet.getString("accountnumber"));
                    request.setAttribute("fullname", resultSet.getString("fullname"));
                    request.setAttribute("idproof", resultSet.getString("idproof"));
                    request.setAttribute("dob", resultSet.getString("dob"));
                    request.setAttribute("email", resultSet.getString("email"));
                    request.setAttribute("mobilenumber", resultSet.getString("mobilenumber"));
                    request.setAttribute("gender", resultSet.getString("gender"));
                    request.setAttribute("typeofaccount", resultSet.getString("typeofaccount"));
                    request.getRequestDispatcher("modifyCustomerDetails.jsp").forward(request, response);
                }
            } else {
                response.getWriter().println("Account number not found.");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
