/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javaweb.model;

/**
 *
 * @author autummzebtotanel
 */
public class Buku {
    // Encapsulation: Variable private
    private int idBuku;
    private String judulBuku;
    private String pengarang;
    private String penerbit;
    private int tahunTerbit;
    private int stok; 
    private String gambar;

    // Constructor Kosong
    public Buku() {}

    // Constructor Lengkap
    public Buku(int id, String judul, String pengarang, String penerbit, int tahun, int stok) {
        this.idBuku = id;
        this.judulBuku = judul;
        this.pengarang = pengarang;
        this.penerbit = penerbit;
        this.tahunTerbit = tahun;
        this.stok = stok;
    }

    // Getter & Setter 
    public int getIdBuku() { return idBuku; }
    public void setIdBuku(int idBuku) { this.idBuku = idBuku; }

    public String getJudulBuku() { return judulBuku; }
    public void setJudulBuku(String judulBuku) { this.judulBuku = judulBuku; }

    public String getPengarang() { return pengarang; }
    public void setPengarang(String pengarang) { this.pengarang = pengarang; }

    public String getPenerbit() { return penerbit; }
    public void setPenerbit(String penerbit) { this.penerbit = penerbit; }

    public int getTahunTerbit() { return tahunTerbit; }
    public void setTahunTerbit(int tahunTerbit) { this.tahunTerbit = tahunTerbit; }

    public int getStok() { return stok; }
    public void setStok(int stok) { this.stok = stok; }
    
    public String getGambar() { return gambar; }
    public void setGambar(String gambar) { this.gambar = gambar; }
}