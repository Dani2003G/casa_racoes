package model.dao;

import model.dao.impl.ProdutosDaoJDBC;

public class DaoFactory {
    public static ProdutosDAO createProdutosDao() {
        return new ProdutosDaoJDBC();
    }
}
