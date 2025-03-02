<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.auth.Produit, com.auth.ProduitDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un Produit</title>
    <style>
        /* Base styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h2 {
            text-align: center; /* Center the title */
            color: #2c3e50;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        /* Navigation Bar */
        nav {
            background-color: #34495e;
            padding: 10px 20px;
            text-align: right;
        }

        nav a {
            text-decoration: none;
            color: white;
            font-size: 1.1rem;
            padding: 8px 15px;
            border-radius: 4px;
            margin: 0 10px;
        }

        nav a:hover {
            background-color: #2c3e50;
        }

        /* Form styles */
        form {
            width: 60%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: 1rem;
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }

        button {
            background-color: #2980b9; /* Professional blue */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            width: 100%;
        }

        button:hover {
            background-color: #2471a3; /* Darker blue on hover */
        }

    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <a href="index.jsp">Retour à la liste</a>
    </nav>

    <h2>Ajouter un produit</h2>

    <!-- Form to add product -->
    <form action="ProduitServlet" method="post">
        <label>Nom :</label>
        <input type="text" name="nom" required><br>

        <label>Description :</label>
        <input type="text" name="description" required><br>

        <label>Prix :</label>
        <input type="number" step="0.01" name="prix" required><br>

        <label>Image (URL) :</label>
        <input type="text" name="image" required><br>

        <button type="submit">Ajouter</button>
    </form>
</body>
</html>
