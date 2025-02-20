package servletProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/CarDataServlet")
public class CarDataServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Connection connect() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/Car_data";
            String username = "root";
            String password = "aravind";
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            stringBuilder.append(line);
        }

        try {
            JSONObject json = new JSONObject(stringBuilder.toString());
            String model = json.getString("Model");
            int year = json.getInt("Year");
            double price = json.getDouble("Price");
            String color = json.getString("Color");
            String engineType = json.getString("EngineType");

            try (Connection conn = connect()) {
                String query = "INSERT INTO CarDataFile (Model, Year, Price, Color, EngineType) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, model);
                    stmt.setInt(2, year);
                    stmt.setDouble(3, price);
                    stmt.setString(4, color);
                    stmt.setString(5, engineType);
                    int rowsAffected = stmt.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("{\"status\":\"success\", \"message\":\"Data inserted successfully\"}");
                    } else {
                        out.println("{\"status\":\"error\", \"message\":\"Failed to insert data\"}");
                    }
                }
            }
        } catch (SQLException | JSONException e) {
            out.println("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");

        if (id != null) {
            try (Connection conn = connect()) {
                String query = "SELECT * FROM CarDataFile WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setInt(1, Integer.parseInt(id));
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("id", rs.getInt("id"));
                        jsonObject.put("Model", rs.getString("Model"));
                        jsonObject.put("Year", rs.getInt("Year"));
                        jsonObject.put("Price", rs.getDouble("Price"));
                        jsonObject.put("Color", rs.getString("Color"));
                        jsonObject.put("EngineType", rs.getString("EngineType"));
                        out.println(jsonObject.toString());
                    } else {
                        out.println("{\"status\":\"error\", \"message\":\"No car found with this ID\"}");
                    }
                }
            } catch (SQLException | JSONException e) {
                out.println("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
            }
        } else {
            try (Connection conn = connect()) {
                String query = "SELECT * FROM CarDataFile";
                try (Statement stmt = conn.createStatement()) {
                    ResultSet rs = stmt.executeQuery(query);

                    JSONArray jsonArray = new JSONArray();
                    while (rs.next()) {
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("id", rs.getInt("id"));
                        jsonObject.put("Model", rs.getString("Model"));
                        jsonObject.put("Year", rs.getInt("Year"));
                        jsonObject.put("Price", rs.getDouble("Price"));
                        jsonObject.put("Color", rs.getString("Color"));
                        jsonObject.put("EngineType", rs.getString("EngineType"));
                        jsonArray.put(jsonObject);
                    }
                    out.println(jsonArray.toString());
                }
            } catch (SQLException | JSONException e) {
                out.println("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
            }
        }
    }
}
