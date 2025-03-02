package com.auth;


public class Produit {
    private int id;
    private String nom;
    private String description;
    private double prix;
    private String image;

    // Constructeurs
    public Produit() {}

    public Produit(int id, String nom, String description, double prix, String image) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.prix = prix;
        this.image = image;
    }
    public Produit( String nom, String description, double prix, String image) {
        this.nom = nom;
        this.description = description;
        this.prix = prix;
        this.image = image;
    }

    // Getters et Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrix() { return prix; }
    public void setPrix(double prix) { this.prix = prix; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    @Override
    public String toString() {
        return "Produit{id=" + id + ", nom='" + nom + "', description='" + description + "', prix=" + prix + ", image='" + image + "'}";
    }
}
