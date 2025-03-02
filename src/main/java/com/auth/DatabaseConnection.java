package com.auth;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/tp11";
    private static final String USER = "postgres";
    private static final String PASSWORD = "ayedii";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver"); // Charge le driver PostgreSQL
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Connexion réussie !");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ Driver PostgreSQL non trouvé !");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Erreur de connexion à la base de données !");
            e.printStackTrace();
        }
        return connection;
    }
}
