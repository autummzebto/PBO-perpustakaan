/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javaweb.model;

public class Peminjaman {
    private int idPinjam;
    private String namaPeminjam;
    private int idBuku;
    private String status;
    
    // Constructor, Getters, and Setters
    public Peminjaman() {}

    public int getIdPinjam() { return idPinjam; }
    public void setIdPinjam(int idPinjam) { this.idPinjam = idPinjam; }

    public String getNamaPeminjam() { return namaPeminjam; }
    public void setNamaPeminjam(String namaPeminjam) { this.namaPeminjam = namaPeminjam; }

    public int getIdBuku() { return idBuku; }
    public void setIdBuku(int idBuku) { this.idBuku = idBuku; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
