/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.autum.javaweb.perpustakaan.controller;

import com.autum.javaweb.perpustakaan.dao.PeminjamanDAO;
import java.io.IOException;

// --- PERHATIKAN BAGIAN INI ---
// Jika "jakarta" di bawah ini merah, ganti menjadi "javax"
// Contoh: import javax.servlet.ServletException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
// -----------------------------

@WebServlet(name = "PeminjamanServlet", urlPatterns = {"/PeminjamanServlet"})
public class PeminjamanServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil perintah: mau 'pinjam' atau 'kembali'?
        String action = request.getParameter("action");
        
        // 2. Siapkan DAO
        PeminjamanDAO dao = new PeminjamanDAO();

        // 3. Cek Logika
        if ("pinjam".equals(action)) {
            // --- LOGIKA PEMINJAMAN ---
            try {
                // Ambil ID Buku dari link
                String idBukuStr = request.getParameter("id_buku");
                // Cek agar tidak error jika id null
                if(idBukuStr != null) {
                    int idBuku = Integer.parseInt(idBukuStr);
                    
                    // Ambil nama user dari Session (agar otomatis sesuai login)
                    HttpSession session = request.getSession();
                    // Sesuaikan "username" dengan nama session login Anda
                    String namaUser = (String) session.getAttribute("username"); 
                    
                    // Jika session kosong (belum login), pakai nama Guest sementara
                    if(namaUser == null) {
                        namaUser = "Guest"; 
                    }

                    // Simpan ke database
                    boolean sukses = dao.simpanPeminjaman(namaUser, idBuku);
                    
                    // Redirect kembali ke halaman daftar buku
                    if (sukses) {
                        response.sendRedirect("daftar_buku.jsp?msg=BerhasilPinjam");
                    } else {
                        response.sendRedirect("daftar_buku.jsp?msg=GagalPinjam");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("daftar_buku.jsp?msg=Error");
            }
            
        } else if ("kembali".equals(action)) {
            // --- LOGIKA PENGEMBALIAN ---
            try {
                String idPinjamStr = request.getParameter("id_pinjam");
                if(idPinjamStr != null) {
                    int idPinjam = Integer.parseInt(idPinjamStr);
                    
                    // Update database
                    dao.kembalikanBuku(idPinjam);
                    
                    // Redirect kembali ke halaman peminjaman
                    response.sendRedirect("daftar_pinjam.jsp?msg=BukuDikembalikan");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}