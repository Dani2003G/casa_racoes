package model.dao;

import java.util.List;
import model.dto.ProdutosDTO;

public interface ProdutosDAO {
    
    void insert(ProdutosDTO produtoDTO);
    List<ProdutosDTO> findAll();
}
