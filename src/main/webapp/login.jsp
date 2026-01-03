<%-- 
    Document   : login
    Created on : 4 Dec 2025, 15.19.40
    Author     : autummzebtotanel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Perpustakaan</title>
        <link rel="icon" type="image/jpg" href="images/favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        
        <div class="container mt-5">
            <div class="row justify-content-center"> <div class="col-md-5">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white text-center">
                            <h4>Login Sistem</h4>
                        </div>
                        <div class="card-body p-4">
                            <form action="proses_login.jsp" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Username</label>
                                    <input type="text" name="username" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Login Sebagai</label>
                                    <select name="level" class="form-select">
                                        <option value="anggota">Anggota</option>
                                        <option value="admin">Admin</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Masuk</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
