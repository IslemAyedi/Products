package com.auth;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProduitDAO {
    public List<Produit> getAllProduits() {
        List<Produit> produits = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();

        if (connection == null) {
            System.out.println("❌ Impossible de se connecter à la base de données !");
            return produits;
        }

        String query = "SELECT * FROM produits";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Produit p = new Produit();
                p.setId(rs.getInt("id"));
                p.setNom(rs.getString("nom"));
                p.setDescription(rs.getString("description"));
                p.setPrix(rs.getDouble("prix"));
                p.setImage(rs.getString("image"));
                produits.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produits;
    }
    public Produit getProduitById(int id) {
        String query = "SELECT * FROM produits WHERE id = ?";
        Produit produit = null;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                produit = new Produit(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("description"),
                        rs.getDouble("prix"),
                        rs.getString("image")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produit;
    }

    public void ajouterProduit(Produit p) {
        String query = "INSERT INTO produits (nom, description, prix, image) VALUES (?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, p.getNom());
            pstmt.setString(2, p.getDescription());
            pstmt.setDouble(3, p.getPrix());
            pstmt.setString(4, p.getImage());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void supprimerProduit(int id) {
        String query = "DELETE FROM produits WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void modifierProduit(Produit p) {
        String query = "UPDATE produits SET nom=?, description=?, prix=?, image=? WHERE id=?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, p.getNom());
            pstmt.setString(2, p.getDescription());
            pstmt.setDouble(3, p.getPrix());
            pstmt.setString(4, p.getImage());
            pstmt.setInt(5, p.getId());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
