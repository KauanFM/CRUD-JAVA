<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alterar Produtos</title>
        <style>
            * {
                margin: 0 auto;
            }
            
             body {
                text-align: center;
                margin-top: 70px
            }
        </style>
    </head>
    <body> 
       <%

            // Recebendo os parâmetros alterados do formulario carregaprod.jsp 
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome");
            String marca = request.getParameter("marca");
            double preco = Double.parseDouble(request.getParameter("preco"));

            try { // Tratando Exceções 
            
                //Fazer a conexão com o Banco de Dados //
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jojokau8871");

                //alterar os dados na tabela produto do banco de dados //
                st = conecta.prepareStatement("UPDATE produto SET nome = ?, marca = ?, preco = ? WHERE codigo = ?");
                st.setString(1, nome);
                st.setString(2, marca);
                st.setDouble(3, preco);
                st.setInt(4, codigo);
                st.executeUpdate(); // Executa o comando sql INSERT
                out.print("Produto alterado com sucesso!");
                
            } catch (Exception x) {
                String erro = x.getMessage();
                out.print("Erro: " + erro); 
            }


        %>
    </body>
</html>
