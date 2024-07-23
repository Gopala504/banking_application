package banker;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TransactionHistoryServlet")
public class TransactionHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int customerId = (int) session.getAttribute("customerId");

        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "SELECT transactionType, amount, transactionDate FROM transactions WHERE customerId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, customerId);

            ResultSet resultSet = statement.executeQuery();

            List<Transaction> transactions = new ArrayList<>();
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionType(resultSet.getString("transactionType"));
                transaction.setAmount(resultSet.getDouble("amount"));
                transaction.setTransactionDate(resultSet.getString("transactionDate"));
                transactions.add(transaction);
            }

            // Set transactions list as request attribute
            request.setAttribute("transactions", transactions);
            request.getRequestDispatcher("transactionHistory.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
