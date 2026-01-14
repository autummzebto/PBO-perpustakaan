/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autum.javaweb.perpustakaan.dao;

import com.mycompany.javaweb.koneksi.Koneksi;
import com.mycompany.javaweb.model.Buku;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BukuDAO {

    // --- 1. AMBIL SEMUA DATA ---
    public List<Buku> getAllBuku() {
        List<Buku> listBuku = new ArrayList<>();
        try {
            Connection con = Koneksi.getConnection();
            String sql = "SELECT * FROM buku ORDER BY id_buku ASC";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
                listBuku.add(mapToBuku(rs));
            }
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return listBuku;
    }

    // --- 2. PENCARIAN ---
    public List<Buku> cariBuku(String keyword) {
        List<Buku> listBuku = new ArrayList<>();
        try {
            Connection con = Koneksi.getConnection();
            String sql = "SELECT * FROM buku WHERE judul_buku ILIKE ? OR pengarang ILIKE ? ORDER BY id_buku ASC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                listBuku.add(mapToBuku(rs));
            }
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return listBuku;
    }

    // --- 3. AMBIL SATU BUKU (Untuk Edit) ---
    public Buku getBukuById(int id) {
        Buku b = null;
        try {
            Connection con = Koneksi.getConnection();
            String sql = "SELECT * FROM buku WHERE id_buku = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                b = mapToBuku(rs);
            }
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return b;
    }

    // --- 4. TAMBAH BUKU (INSERT) ---
    public void tambahBuku(Buku b) {
        try {
            Connection con = Koneksi.getConnection();
            if(b.getGambar() == null || b.getGambar().isEmpty()) b.setGambar("no-image.jpg");
            
            String sql = "INSERT INTO buku (judul_buku, pengarang, penerbit, tahun_terbit, stok, gambar) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, b.getJudulBuku());
            ps.setString(2, b.getPengarang());
            ps.setString(3, b.getPenerbit());
            ps.setInt(4, b.getTahunTerbit());
            ps.setInt(5, b.getStok());
            ps.setString(6, b.getGambar());
            ps.executeUpdate();
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // --- 5. EDIT BUKU (UPDATE) ---
    public void updateBuku(Buku b) {
        try {
            Connection con = Koneksi.getConnection();
            String sql = "UPDATE buku SET judul_buku=?, pengarang=?, penerbit=?, tahun_terbit=?, stok=?, gambar=? WHERE id_buku=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, b.getJudulBuku());
            ps.setString(2, b.getPengarang());
            ps.setString(3, b.getPenerbit());
            ps.setInt(4, b.getTahunTerbit());
            ps.setInt(5, b.getStok());
            ps.setString(6, b.getGambar());
            ps.setInt(7, b.getIdBuku());
            ps.executeUpdate();
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // --- 6. HAPUS BUKU (DELETE) ---
    public void hapusBuku(int id) {
        try {
            Connection con = Koneksi.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM buku WHERE id_buku=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // --- 7. DASHBOARD: HITUNG TOTAL JUDUL ---
    public int hitungTotalBuku() {
        int total = 0;
        try {
            Connection con = Koneksi.getConnection();
            ResultSet rs = con.createStatement().executeQuery("SELECT COUNT(*) FROM buku");
            if(rs.next()) total = rs.getInt(1);
            con.close();
        } catch(Exception e) { e.printStackTrace(); }
        return total;
    }

    // --- 8. DASHBOARD: HITUNG TOTAL STOK ---
    public int hitungTotalStok() {
        int total = 0;
        try {
            Connection con = Koneksi.getConnection();
            ResultSet rs = con.createStatement().executeQuery("SELECT SUM(stok) FROM buku");
            if(rs.next()) total = rs.getInt(1);
            con.close();
        } catch(Exception e) { e.printStackTrace(); }
        return total;
    }

    // --- HELPER METHODS ---
    public void kurangiStok(int idBuku) {
        try {
            Connection con = Koneksi.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE buku SET stok = stok - 1 WHERE id_buku = ?");
            ps.setInt(1, idBuku);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    public void tambahStok(int idBuku) {
        try {
            Connection con = Koneksi.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE buku SET stok = stok + 1 WHERE id_buku = ?");
            ps.setInt(1, idBuku);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    public int getStokById(int idBuku) {
        int stok = 0;
        try {
            Connection con = Koneksi.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT stok FROM buku WHERE id_buku = ?");
            ps.setInt(1, idBuku);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) stok = rs.getInt("stok");
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return stok;
    }

    private Buku mapToBuku(ResultSet rs) throws SQLException {
        Buku b = new Buku();
        b.setIdBuku(rs.getInt("id_buku"));
        b.setJudulBuku(rs.getString("judul_buku"));
        b.setPengarang(rs.getString("pengarang"));
        b.setPenerbit(rs.getString("penerbit"));
        b.setTahunTerbit(rs.getInt("tahun_terbit"));
        b.setStok(rs.getInt("stok"));
        
        String img = rs.getString("gambar");
        b.setGambar((img == null || img.isEmpty()) ? "no-image.jpg" : img);
        return b;
    }
}