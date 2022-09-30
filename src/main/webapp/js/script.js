document.getElementById("form").addEventListener("submit", function (e) {
    let nome = document.getElementById("nome");
    let errorNome = document.getElementById("errorNome");
    let descricao = document.getElementById("descricao");
    let errorDescricao = document.getElementById("errorDescricao");
    let precoS = document.getElementById("preco");
    let preco;
    let errorPreco = document.getElementById("errorPreco");
    let quantidadeS = document.getElementById("quantidade");
    let quantidade;
    let errorQuantidade = document.getElementById("errorQuantidade");
    let qtdeErrors = 0;
    if (nome.value.length < 5 || nome.value.length > 45) {
        nome.classList.add('errorInput');
        errorNome.classList.remove("hide");
        qtdeErrors++;
    } else if (nome.value.length >= 5 && nome.value.length <= 45) {
        nome.classList.remove("errorInput");
        errorNome.classList.add("hide");
    }
    
    if(descricao.value.length < 15 || descricao.value.length > 90) {
        descricao.classList.add("errorInput");
        errorDescricao.classList.remove("hide");
        qtdeErrors++;
    } else if (descricao.value.length >= 15 && descricao.value.length <= 90) {
        descricao.classList.remove("errorInput");
        errorDescricao.classList.add("hide");
    }
    
    try {
        preco = parseFloat(precoS.value);
        if(isNaN(preco))
            throw "error";;
        precoS.classList.remove("errorInput");
        errorPreco.classList.add("hide");
    } catch(e) {
        precoS.classList.add("errorInput");
        errorPreco.classList.remove("hide");
        qtdeErrors++;
    }
    
    try {
        quantidade = parseFloat(quantidadeS.value);
        if(isNaN(quantidade))
            throw "error";
        if(Number.isInteger(quantidade)){
            quantidadeS.classList.remove("errorInput");
            errorQuantidade.classList.add("hide");
        } else {
            throw "error";
        }
    } catch(e) {
        quantidadeS.classList.add("errorInput");
        errorQuantidade.classList.remove("hide");
        qtdeErrors++;
    }
    
    if(qtdeErrors > 0)
        e.preventDefault();
    
});
