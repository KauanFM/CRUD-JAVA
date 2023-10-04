<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Produtos</title>
        <style>

            * {
                margin: 0 auto
            }

            form {
                width: 40%;
                line-height: 2;
                margin-top:70px
            }

            input[type=submit]{
                color: black;
                margin-top: 35px;
                padding: 5px 10px;
                background-color: #66ff33;
                border-radius: 10px;
                border: solid 2px;
            }

        </style>        
    </head>
    <body>
        <%
          //Recebendo o código digitado
          int cod = Integer.parseInt(request.getParameter("codigo"));
          
          
          try { // Tratamento de Exceções
          
            //Conexão com o Banco de Dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "jojokau8871");
            
            //Busca o produto pelo código recebido
            PreparedStatement st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ?");
            st.setInt(1, cod);
            ResultSet rs = st.executeQuery();
            
            //Verifica se o produto de código informado foi encontrado
            if(!rs.next()) {
                out.print("Produto não encontrado");
            } else {
        %>        
            <form method="post" action="alterar_produtos.jsp">

            <p>
                <label for="codigo">Código:</label>
                <input type="number" step="1" name="codigo" id="codigo" value="<%= rs.getString("codigo") %>" readonly>
            </p>

            <p>
                <label for="nome">Nome do produto:</label>
                <input type="text" name="nome" id="nome" size="50" maxlength="50" value="<%= rs.getString("nome") %>" required>
            </p>

            <p>
                <label for="marca">Marca:</label>
                <input type="text" name="marca" id="marca" size="50" maxlength="50" value="<%= rs.getString("marca") %>" required>
            </p>

            <p>
                <label for="preco">Preço:</label>
                <input type="number" step="0.5" name="preco" id="preco" value="<%= rs.getString("preco") %>" required>
            </p>

            <p>
                <input type="submit" value="Salvar Alterações">
            </p>
        </form>    
        <%
            }
            
          } catch (Exception x) {
            String erro = x.getMessage();
            out.print("Mensagem de erro: " + erro);
          }
           
          
        %>
    </body>
</html>
