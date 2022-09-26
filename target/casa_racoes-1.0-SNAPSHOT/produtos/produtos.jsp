<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.DaoFactory"%>
<%@page import="model.dao.ProdutosDAO"%>
<%@page import="model.dto.ProdutosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produtos</title>
        <%@include file="/includes/head.jsp" %>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <div class="container mt-4">
            <%
                ProdutosDAO dao = DaoFactory.createProdutosDao();
                List<ProdutosDTO> list = dao.findAll();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                if(list != null) {
            %>
            <h2 class="text-center mb-3">Produtos</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Perço</th>
                        <th scope="col">Quantidade</th>
                        <th scope="col">Validade</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Excluir</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        for (int i = 0; i < list.size(); i++) {
                    %>
                    <tr>
                        <th scope="row"><%=list.get(i).getId()%></th>
                        <td><%=list.get(i).getNome()%></td>
                        <td><%=list.get(i).getDescricao()%></td>
                        <td><%=list.get(i).getPreco()%></td>
                        <td><%=list.get(i).getQuantidade()%></td>
                        <%if(list.get(i).getValidade() != null) {%>
                            <td><%=list.get(i).getQuantidade()%></td>
                        <%} else {%>
                            <td>Produto não possue validade</td>
                        <%}%>
                        <td><a href="#" class="btn btn-warning">Atualizar</a></td>
                        <td><a href="#" class="btn btn-danger">Excluir</a></td>
                    </tr>
                    
                    <%}%>
                </tbody>
            </table>
            <%}%>
        </div>
    </body>
</html>
