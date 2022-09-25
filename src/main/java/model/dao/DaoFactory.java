package model.dao;

import db.DB;
import model.dao.impl.ProdutosDaoJDBC;

public class DaoFactory {
    public static ProdutosDAO createProdutosDao() {
        return new ProdutosDaoJDBC(DB.getConnection());
    }
}
