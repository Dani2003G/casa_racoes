<%-- 
    Document   : newjs
    Created on : 26 de set. de 2022, 16:13:01
    Author     : Daniel
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="model.dao.DaoFactory"%>
<%@page import="model.dao.ProdutosDAO"%>
<%@page import="model.dto.ProdutosDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
            ProdutosDTO produtosDTO = new ProdutosDTO();
            String mod = request.getParameter("mod");
            ProdutosDAO dao = DaoFactory.createProdutosDao();
            if(mod.equals("cad") || mod.equals("edit")) {
                try {
                    produtosDTO.setNome(request.getParameter("nome"));
                    produtosDTO.setDescricao(request.getParameter("descricao"));
                    String precoS = request.getParameter("preco");
                    precoS = precoS.replace(".", "");
                    precoS = precoS.replace(",", ".");
                    produtosDTO.setPreco(Double.parseDouble(precoS));
                    produtosDTO.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                    if(request.getParameter("validade") != "") {
                        String validade = request.getParameter("validade");
                        validade = validade.replaceAll("-", "/");
                        produtosDTO.setValidade(sdf.parse(validade));
                    }
                    if(mod.equals("cad")) {
                        dao.insert(produtosDTO);
                        response.sendRedirect("modificar_produto.jsp?sus=cad&pg=prod&mod=cad");
                    }else {
                        int id = Integer.parseInt(request.getParameter("id"));
                        dao.update(produtosDTO, id);
                        response.sendRedirect("modificar_produto.jsp?sus=edit&pg=prod&mod=edit");
                    }
                    
                } catch(Exception e) {
                   if(mod.equals("cad")){
                        response.sendRedirect("modificar_produto.jsp?err=cad&pg=prod&mod=cad");
                    } else  {
                        response.sendRedirect("modificar_produto.jsp?err=edit&pg=prod&mod=edit");
                    }
                }
            } else {
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("modificar_produto.jsp?sus=exc&pg=prod&mod=exc");
                } catch(NumberFormatException e) {
                    response.sendRedirect("modificar_produto.jsp?err=exc&pg=prod&mod=exc");
                }
            }
        %>
    </body>
</html>
