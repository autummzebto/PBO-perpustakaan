/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.javaweb.koneksi;

import java.sql.Connection;
import java.sql.DriverManager;

public class Koneksi {
    
    public static Connection getConnection() {
        Connection con = null;
        try {
            // 1. Panggil Driver PostgreSQL
            Class.forName("org.postgresql.Driver");
            
            // 2. Setting URL, User, dan Password
            String url = "jdbc:postgresql://localhost:5432/db_perpustakaan";
            String user = "postgres";
            
            // PENTING: Masukkan password yang tadi Anda ketik di terminal!
            String password = "murg1778"; 
            
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Koneksi Berhasil!");
            
        } catch (Exception e) {
            System.out.println("Koneksi Gagal: " + e.getMessage());
        }
        return con;
    }
    
    // Main method untuk mengetes koneksi saja (Klik Kanan -> Run File)
    public static void main(String[] args) {
        getConnection();
    }
}
