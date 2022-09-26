<%@page import="model.dto.ProdutosDTO"%>
<%@page import="model.dao.DaoFactory"%>
<%@page import="model.dao.ProdutosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/includes/head.jsp"%>
        <%  
            ProdutosDTO produtosDTO = new ProdutosDTO();
            if(mod.equals("edit")){mod = "Editar produto";}
            if(mod.equals("exc")){mod = "Deletar produto";}
            if(mod.equals("cad")){mod = "Cadastrar produto";}
            if(err.equals("cad")){err = "cadastrar";}
            if(err.equals("edit")){err = "atualizar";}
            if(err.equals("exc")){err = "deletar";}
            if(sus.equals("cad")){sus = "cadastrar";}
            if(sus.equals("edit")){sus = "atualizar";}
            if(sus.equals("exc")){sus = "deletar";}
            
            if(id > 0) {
                ProdutosDAO dao = DaoFactory.createProdutosDao();
                produtosDTO = dao.findById(id);
            }
        %>
        <title><%=mod%></title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>

        <div class="container">
            <div class="card mt-5">

                <div class="card-header">
                    <h3 class="text-center"><%=mod%></h3>
                    <%if(err != "") {%>
                        <p class="text-danger text-center">Erro ao <%=err%> o produto, tente novamente</p>
                    <%}%>
                    <%if(sus != "") {%>
                        <p class="text-success text-center">Sucesso ao <%=sus%> o produto</p>
                    <%}%>
                </div>

                <div class="card-body">
                    <form action="modificar_produto_controller.jsp" method="POST">
                        <div class="input-group mb-2">
                            <%if(id > 0){ %>
                                <input type="hidden" value="<%=produtosDTO.getId()%>" name="id">
                            <%}%>
                            <input type="hidden" value="<%=request.getParameter("mod")%>" name="mod">
                            <span class="input-group-text">Nome</span> 
                            <input
                                class="form-control" type="text" 
                                <%if(id > 0){%> value="<%=produtosDTO.getNome()%>"<%}%>
                                name="nome" placeholder="Nome">
                        </div>

                        <div class="input-group mb-2">
                            <span class="input-group-text">descrição</span> <input
                                class="form-control" type="text" 
                                <%if(id > 0){%> value="<%=produtosDTO.getDescricao()%>"<%}%>
                                name="descricao" placeholder="decricao">
                        </div>

                        <div class="input-group mb-2">
                            <span class="input-group-text">Preço</span> <input
                                class="form-control" type="text" 
                                <%if(id > 0){%> value="<%=produtosDTO.getPreco()%>"<%}%>
                                name="preco" placeholder="preco">
                        </div>

                        <div class="input-group mb-2">
                            <span class="input-group-text">Quantidade</span> <input
                                class="form-control" type="text"
                                <%if(id > 0){%> value="<%=produtosDTO.getQuantidade()%>"<%}%>
                                name="quantidade" placeholder="quantidade">
                        </div>

                        <div class="input-group mb-2">
                            <span class="input-group-text">Validade</span> <input
                                class="form-control" type="date" 
                                <%if(id > 0){%> value="<%=produtosDTO.getValidade()%>"<%}%>
                                name="validade" placeholder="validade">
                        </div>

                        <div class="d-grid gap-2">
                            <button class="btn btn-primary" type="submit"><%=mod%></button>
                            <a href="produtos.jsp?pg=prod" class="btn btn-info" type="button">Voltar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
