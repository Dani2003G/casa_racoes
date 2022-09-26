package model.dao;

import java.util.List;
import model.dto.ProdutosDTO;

public interface ProdutosDAO {
    
    void insert(ProdutosDTO produtoDTO);
    void delete(int id);
    List<ProdutosDTO> findAll();
}
