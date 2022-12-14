package model.dao.impl;

import db.DB;
import db.DbException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
        }
    }
    
    @Override
    public void update(ProdutosDTO produto, int id) {
        PreparedStatement st = null;

        try {
            st = conn.prepareStatement(
                    "UPDATE produtos "
                    + "set nome = ?, descricao = ?, preco = ?, quantidade = ?, validade = ? "
                    + "WHERE id = ?"
            );

            st.setString(1, produto.getNome());
            st.setString(2, produto.getDescricao());
            st.setDouble(3, produto.getPreco());
            st.setInt(4, produto.getQuantidade());
            if (produto.getValidade() != null) {
                st.setDate(5, new java.sql.Date(produto.getValidade().getTime()));
            } else {
                st.setDate(5, null);
            }

            st.setInt(6, id);

            st.executeUpdate();

        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
        }
    }

    @Override
    public void delete(int id) {
        PreparedStatement st = null;

        try {
            st = conn.prepareStatement("DELETE FROM produtos WHERE id = ?");

            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
        }
    }

    @Override
    public ProdutosDTO findById(int id) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = conn.prepareStatement("SELECT * FROM produtos WHERE id = ?");

            st.setInt(1, id);

            rs = st.executeQuery();

            ProdutosDTO produtosDTO = new ProdutosDTO();

            if (rs.next()) {
                produtosDTO.setId(rs.getInt("id"));
                produtosDTO.setNome(rs.getString("nome"));
                produtosDTO.setDescricao(rs.getString("descricao"));
                produtosDTO.setPreco(rs.getDouble("preco"));
                produtosDTO.setQuantidade(rs.getInt("quantidade"));
                produtosDTO.setValidade(rs.getDate("validade"));
            }

            return produtosDTO;
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeResultSet(rs);
            DB.closeStatement(st);
        }
    }

    @Override
    public List<ProdutosDTO> findAll() {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = conn.prepareStatement("SELECT * FROM produtos");

            rs = st.executeQuery();

            List<ProdutosDTO> list = new ArrayList<>();

            while (rs.next()) {
                ProdutosDTO produtosDTO = new ProdutosDTO();
                produtosDTO.setId(rs.getInt("id"));
                produtosDTO.setNome(rs.getString("nome"));
                produtosDTO.setDescricao(rs.getString("descricao"));
                produtosDTO.setPreco(rs.getDouble("preco"));
                produtosDTO.setQuantidade(rs.getInt("quantidade"));
                produtosDTO.setValidade(rs.getDate("validade"));
                list.add(produtosDTO);
            }
            return list;
        } catch (SQLException e) {
            throw new DbException(e.getMessage());
        } finally {
            DB.closeStatement(st);
            DB.closeResultSet(rs);
        }
    }
}
