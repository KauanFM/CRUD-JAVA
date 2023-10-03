<%-- 
    Document   : listapro
    Created on : 2 de out. de 2023, 19:16:46
    Author     : Mendes
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
        <style>
            * {
                margin: 0 auto;
            }

            table {
                width: 40%;
                margin-top: 40px
            }

        </style>
    </head>

    <%
        try { // Tratando Exceções

            //Fazer a conexão com o Banco de Dados //
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jojokau8871");

            //Listar os dados da tabela produto do banco de dados //
            st = conecta.prepareStatement("SELECT * FROM produto");
            ResultSet rs = st.executeQuery();
    %>
    <table border="1">
        <tr>
            <th>Código</th><th>Nome</th><th>Marca</th><th>Preço</th>
        </tr>                
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("codigo")%></td>
            <td><%= rs.getString("nome")%></td>
            <td><%= rs.getString("marca")%></td>
            <td><%= rs.getString("preco")%></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } catch (Exception x) {
            out.print("Mensagem de erro: " + x.getMessage());
        }

    %>

</html>
