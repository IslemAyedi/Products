<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.auth.Produit, com.auth.ProduitDAO, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Produits</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #f2f2f2;
        }
        img {
            border-radius: 4px;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>Ajouter un produit</h2>
<form action="ProduitServlet" method="post">
    <label>Nom :</label> <input type="text" name="nom" required><br>
    <label>Description :</label> <input type="text" name="description" required><br>
    <label>Prix :</label> <input type="number" step="0.01" name="prix" required><br>
    <label>Image (URL) :</label> <input type="text" name="image" required><br>
    <button type="submit">Ajouter</button>
</form>

<h2>Produits disponibles</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Prix</th>
        <th>Image</th>
        <th>Actions</th>
    </tr>
    <%
        ProduitDAO produitDAO = new ProduitDAO();
        List<Produit> produits = produitDAO.getAllProduits();
        for (Produit p : produits) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getNom() %></td>
        <td><%= p.getDescription() %></td>
        <td><%= p.getPrix() %> €</td>
        <td><img src="<%= p.getImage() %>" width="100" /></td>
        <td>
            <a href="modifier.jsp?id=<%= p.getId() %>">✏ Modifier</a>
            <form action="SupprimerProduitServlet" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= p.getId() %>">
                <button type="submit" onclick="return confirm('Supprimer ce produit ?');">🗑 Supprimer</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
