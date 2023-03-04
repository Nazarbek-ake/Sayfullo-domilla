package org.example.dbService;

import org.example.model.Country;
import org.example.model.Result;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbService {
    String url = "jdbc:postgresql://localhost:5432/country_crud";
    String dbUsername = "postgres";
    String dbPassword="root123";

    public Result addCountry(String name) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);
        String query = "{call add_country(?, ?, ?)}";
        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setString(1, name);
        callableStatement.registerOutParameter(2, Types.VARCHAR);
        callableStatement.registerOutParameter(3, Types.BOOLEAN);
        callableStatement.executeUpdate();
        return new Result(callableStatement.getString(2), callableStatement.getBoolean(3));
    }

    public List<Country> getCountry() throws ClassNotFoundException, SQLException{
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);
        PreparedStatement preparedStatement = connection.prepareStatement("select * from country");
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Country> countries = new ArrayList<>();
        while (resultSet.next()){
            countries.add(new Country(resultSet.getInt("id"),resultSet.getString("name")));
        }
        return countries;
    }
}
