/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autum.javaweb.perpustakaan.dao;

import com.mycompany.javaweb.koneksi.Koneksi;
import com.mycompany.javaweb.model.Peminjaman; // <--- PENTING: Tambahkan ini agar DAO kenal modelnya
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PeminjamanDAO {
    
    // ... (Kode simpanPeminjaman Anda yang lama biarkan saja di sini) ...
    public boolean simpanPeminjaman(String nama, int idBuku) {
        // ... (isi tetap sama) ...
        try {
            Connection con = Koneksi.getConnection();
            String sql = "INSERT INTO peminjaman (nama_peminjam, id_buku, status) VALUES (?, ?, 'Dipinjam')";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nama);
            ps.setInt(2, idBuku);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ... (Kode kembalikanBuku Anda yang lama biarkan saja di sini) ...
    public boolean kembalikanBuku(int idPinjam) {
        // ... (isi tetap sama) ...
        try {
           Connection con = Koneksi.getConnection();
           String sql = "UPDATE peminjaman SET status = 'Dikembalikan' WHERE id_pinjam = ?";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setInt(1, idPinjam);
           ps.executeUpdate();
           return true;
       } catch (Exception e) {
           e.printStackTrace();
           return false;
       }
    }

    // --- TAMBAHAN BARU DI BAWAH SINI ---

    // Fungsi 3: Ambil Semua Data Peminjaman (Untuk ditampilkan di tabel)
    public List<Peminjaman> getAllPeminjaman() {
        List<Peminjaman> list = new ArrayList<>();
        try {
            Connection con = Koneksi.getConnection();
            String sql = "SELECT * FROM peminjaman ORDER BY id_pinjam DESC";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()){
                Peminjaman p = new Peminjaman();
                p.setIdPinjam(rs.getInt("id_pinjam"));
                p.setNamaPeminjam(rs.getString("nama_peminjam"));
                p.setIdBuku(rs.getInt("id_buku"));
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
