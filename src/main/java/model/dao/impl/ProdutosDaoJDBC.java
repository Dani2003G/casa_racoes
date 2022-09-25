package model.dao.impl;

import db.DB;
import db.DbException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.dao.ProdutosDAO;
import model.dto.ProdutosDTO;

public class ProdutosDaoJDBC implements ProdutosDAO {

    private static Connection conn;

    public ProdutosDaoJDBC(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void insert(ProdutosDTO produtoDTO) {
        PreparedStatement st = null;

        try {
            st = conn.prepareStatement(
                    "INSERT INTO produtos "
                    + "(nome, descricao, preco, quantidade, validade) "
                    + "VALUES "
                    + "(?, ?, ?, ?, ?)"
            );

            st.setString(1, produtoDTO.getNome());
            st.setString(2, produtoDTO.getDescricao());
            st.setDouble(3, produtoDTO.getPreco());
            st.setInt(4, produtoDTO.getQuantidade());
            if (produtoDTO.getValidade() != null) {
                st.setDate(5, new java.sql.Date(produtoDTO.getValidade().getTime()));
            } else {
                st.setDate(5, null);
            }

            st.execute();
            
            DB.closeStatement(st);
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
        }
    }
}
