<%-- 
    Document   : salvar_produtos
    Created on : 2 de out. de 2023, 17:17:00
    Author     : Kauan Feitoza Mendes
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
         // Recebendo os parâmetros do cadastro de produtos //
         int codigo;
         String nome, marca;
         double preco;
       
         codigo = Integer.parseInt(request.getParameter("codigo"));
         nome = request.getParameter("nome");
         marca = request.getParameter("marca");
         preco = Double.parseDouble(request.getParameter("preco"));
         
         try {
         //Fazer a conexão com o Banco de Dados //
         Connection conecta;
         PreparedStatement st;
         Class.forName("com.mysql.cj.jdbc.Driver");
         conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jojokau8871");
         
         //inserir os dados na tabela produto do banco de dados //
         st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
         st.setInt(1, codigo);
         st.setString(2, nome);
         st.setString(3, marca);
         st.setDouble(4, preco);
         st.execute(); // Executa o comando sql INSERT
         out.print("Produto cadastrado com sucesso");
         } catch(Exception x) {
            out.print("Erro: " + x.getMessage());
         }
         
         
        %>
    </body>
</html>
