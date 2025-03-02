package com.auth;

import java.sql.Connection;

public class TestDatabase {
    public static void main(String[] args) {
        Connection connection = DatabaseConnection.getConnection();
        if (connection != null) {
            System.out.println("✅ Connexion réussie à la base de données !");
        } else {
            System.out.println("❌ Échec de la connexion !");
        }
    }
}
