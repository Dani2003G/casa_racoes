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
        <%
            ProdutosDAO dao = DaoFactory.createProdutosDao();
            List<ProdutosDTO> list = dao.findAll();
        %>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        <div class="container mt-4">
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                if (list.size() > 0) {
            %>
            <h2 class="text-center mb-3">Produtos</h2>
            <div class="text-center mt-3 mb-3">
                <a href="modificar_produto.jsp?mod=cad&pg=prod" class="btn btn-primary">Clique aqui para cadastrar um novo produto</a>
            </div>
            <div class="table-responsive">
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
                            <%if (list.get(i).getValidade() != null) {%>
                            <td><%=sdf.format(list.get(i).getValidade())%></td>
                            <%} else {%>
                            <td>Produto não possue validade</td>
                            <%}%>
                            <td><a href="modificar_produto.jsp?id=<%=list.get(i).getId()%>&mod=edit&pg=prod" class="btn btn-warning">Editar</a></td>
                            <td><a href="modificar_produto.jsp?id=<%=list.get(i).getId()%>&mod=exc&pg=prod" class="btn btn-danger">Excluir</a></td>
                        </tr>

                        <%}%>
                    </tbody>
                </table>
            </div>
            <%} else {%>
            <h3 class="text-center">Você ainda não possue produtos cadastrados!</h3>
            <div class="text-center mt-3">
                <a href="modificar_produto.jsp?mod=cad&pg=prod" class="btn btn-primary">Clique aqui para cadastrar um</a>
            </div>
            <%}%>
        </div>
        <%if (list.size() < 6) {%>
        <%@include file="../includes/footerfix.jsp"%>
        <%} else {%>
        <%@include file="../includes/footernofix.jsp"%>
        <%}%>
    </body>
</html>
