<%-- 
    Document   : logout
    Created on : 4 Dec 2025, 15.20.32
    Author     : autummzebtotanel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Hapus session
    session.invalidate();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
        <script>
            alert('Anda telah logout!');
            // Gunakan replace agar history back terhapus di browser
            window.location.replace('index.jsp');
        </script>
    </head>
    <body>
        </body>
</html>
