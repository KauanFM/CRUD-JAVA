<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
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

            //Recebe o código do formulário.
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));

            //Conexão com o Banco de Dados.
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jojokau8871");

                //Enviando a query para o MySQL e executando.
                PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate();
                
                //Verifica se foi excluido ou não
                if(resultado == 0) {
                out.print("Esse produto não está cadastrado");
                } else {
                out.print("O produto de código " + cod + " foi excluido com sucesso!");
                }   
            } catch (Exception x) {
                String erro = x.getMessage();
                out.print("Mensagem de erro:" + erro);
            }


        %>
    </body>
</html>
