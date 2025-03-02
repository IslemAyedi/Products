<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.auth.Produit, com.auth.ProduitDAO, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Produits</title>
    <style>
        /* Base styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            color: #333;
        }
img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    max-width: 200px; /* Limit the maximum width */
    height: auto; /* Maintain aspect ratio */
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

        /* Table styles */
        table {
            width: 70%; /* Set the table width to 70% */
            border-collapse: collapse;
            margin: 20px auto; /* Center the table horizontally */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: #34495e;
            color: white;
        }

        table td {
            background-color: #ecf0f1;
        }

        img {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 100%; /* Make image take the full width of the cell */
            height: auto; /* Maintain aspect ratio */
        }

        /* Modifier Button (Blue) */
        .modifier-button,
        .supprimer-button,
        .toggle-description {
            background-color: #2980b9; /* Professional blue for modifier */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            width: auto;
        }

        .modifier-button:hover,
        .supprimer-button:hover,
        .toggle-description:hover {
            background-color: #2471a3; /* Darker blue on hover */
        }

        /* Supprimer Button (Red) */
        .supprimer-button {
            background-color: #e74c3c; /* Red color */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .supprimer-button:hover {
            background-color: #c0392b; /* Darker red on hover */
        }

        /* Toggle Description (Details) Button */
        .toggle-description {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            margin-left: 10px; /* Adding space between details and modifier */
        }

        .toggle-description:hover {
            background-color: #2980b9;
        }

        /* Ensure there is space between Modifier and Supprimer buttons */
        .modifier-button,
        .supprimer-button,
        .toggle-description {
            margin-right: 10px; /* Adds space between buttons */
        }

        /* Flexbox container for buttons */
        .action-buttons {
            display: flex;
            justify-content: center; /* Center the buttons */
            gap: 15px; /* Space between the buttons */
        }

        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0, 0, 0, 0.4); /* Black with transparency */
        }

        /* Modal content */
        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 5px;
            width: 80%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Close button for modal */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }

    </style>

    <script>
        function showDetails(productId, nom, description, prix, image) {
            // Get modal
            var modal = document.getElementById('myModal');
            var modalContent = document.getElementById('modal-content');

            // Fill the modal content with product details
            modalContent.innerHTML = `
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Produit: ${nom}</h2>
                <p><strong>Description:</strong> ${description}</p>
                <p><strong>Prix:</strong> ${prix} €</p>
                <p><strong>Image:</strong></p>
                <img src="${image}" width="100" />
            `;

            // Display the modal
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = "none";
        }
    </script>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <a href="ajoutProduit.jsp">Ajouter un produit</a>
    </nav>

    <h2>Produits disponibles</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prix</th>
            <th>Image</th>
            <th>Actions</th>
            <th>Détails</th>
        </tr>
        <%
            ProduitDAO produitDAO = new ProduitDAO();
            List<Produit> produits = produitDAO.getAllProduits();
            for (Produit p : produits) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getNom() %></td>
            <td><%= p.getPrix() %> €</td>
            <td><img src="<%= p.getImage() %>"  /></td>
            <td>
                <!-- Buttons Container -->
                <div class="action-buttons">
                    <!-- Modifier Button (Blue) -->
                    <a href="modifier.jsp?id=<%= p.getId() %>">
                        <button class="modifier-button">✏ Modifier</button>
                    </a>
                    <form action="SupprimerProduitServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= p.getId() %>">
                        <!-- Supprimer Button (Red) -->
                        <button class="supprimer-button" type="submit" onclick="return confirm('Supprimer ce produit ?');">🗑 Supprimer</button>
                    </form>
                </div>
            </td>
            <td>
                <!-- Button to open modal for product details -->
                <button class="toggle-description" onclick="showDetails(<%= p.getId() %>, '<%= p.getNom() %>', '<%= p.getDescription() %>', '<%= p.getPrix() %>', '<%= p.getImage() %>')">details</button>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <!-- Modal -->
    <div id="myModal" class="modal">
        <div class="modal-content" id="modal-content">
            <!-- Content will be injected here by JavaScript -->
        </div>
    </div>

</body>
</html>
