/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.dao.impl.ProdutosDaoJDBC;

/**
 *
 * @author Daniel
 */
public class DaoFactory {
    public static ProdutosDAO createProdutosDao() {
        return new ProdutosDaoJDBC();
    }
}
