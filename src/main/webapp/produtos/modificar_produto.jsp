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
                </div>

                <div class="card-body">
                    <form action="#" method="POST">
                        <div class="input-group mb-2">
                            <span class="input-group-text">Nome</span> 
                            <input
                                class="form-control" type="text" 
                                <%if(id > 0){%> value="<%=produtosDTO.getId()%>"<%}%>
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
                            <button class="btn btn-success" type="submit"><%=mod%></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
