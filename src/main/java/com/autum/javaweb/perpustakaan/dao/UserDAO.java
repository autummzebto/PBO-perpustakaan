/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.autum.javaweb.perpustakaan.dao;

import com.mycompany.javaweb.koneksi.Koneksi;
import com.mycompany.javaweb.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author autummzebtotanel
 */
public class UserDAO {

    // --- 1. TAMPILKAN SEMUA USER (Untuk Manajemen User) ---
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        try {
            Connection con = Koneksi.getConnection();
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM users ORDER BY id_user ASC");
            while(rs.next()) {
                User u = new User();
                u.setIdUser(rs.getInt("id_user"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setNamaLengkap(rs.getString("nama_lengkap"));
                u.setLevel(rs.getString("level"));
                list.add(u);
            }
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // --- 2. TAMBAH USER (Input Suka-suka) ---
    public void tambahUser(User u) {
        try {
            Connection con = Koneksi.getConnection();
            String sql = "INSERT INTO users (username, password, nama_lengkap, level) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getNamaLengkap());
            ps.setString(4, u.getLevel());
            ps.executeUpdate();
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // --- 3. HAPUS USER ---
    public void hapusUser(int id) {
        try {
            Connection con = Koneksi.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id_user=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // --- 4. CEK LOGIN (Mengecek ke tabel users di PostgreSQL) ---
    public User cekLogin(String username, String password, String level) {
        User u = null;
        try {
            Connection con = Koneksi.getConnection();
            String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND level = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, level);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                u = new User();
                u.setIdUser(rs.getInt("id_user"));
                u.setUsername(rs.getString("username"));
                u.setNamaLengkap(rs.getString("nama_lengkap"));
                u.setLevel(rs.getString("level"));
            }
            con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return u;
    }
}