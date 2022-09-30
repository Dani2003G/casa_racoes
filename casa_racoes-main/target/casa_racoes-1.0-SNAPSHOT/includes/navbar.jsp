<!-- Inicio cabeçalho -->
<header>
    <!-- Início barra de navegação -->
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <div class="container">

            <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#nav-principal">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- início logo -->
            <div>
                <a class="" href="index.jsp">
                    <img class="mt-2 mt-md-0 me-5" <img src="${pageContext.request.contextPath}/img/logo.jpg"/>
                </a>
            </div>
            <!-- Fim logo -->
            <h1 class="text-white d-md-none text-center">Casa de rações</h1>
            <div class="collapse navbar-collapse" id="nav-principal">
                <div class="ms-auto">
                    <h1 class="text-white d-none d-md-inline">Casa de rações</h1>
                    <div class="d-md-flex justify-content-center">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <%
                                    pg = request.getParameter("pg");
                                    if(pg == null) {pg = "";}
                                    if(pg.equals("prod")){
                                %>
                                    <a href="../index.jsp?pg=ini" class="nav-link">Inicio</a>
                                <%} else {%>
                                    <a href="index.jsp?pg=ini" class="nav-link active">Inicio</a>
                                <%}%>
                            </li>
                            <li class="nav-item">
                                <%if(pg.equals("prod")) {%>
                                    <a href="produtos.jsp?pg=prod" class="nav-link active">Produtos</a>
                                <%} else {%>
                                    <a href="produtos/produtos.jsp?pg=prod" class="nav-link">Produtos</a>
                                <%}%>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ms-auto">
                    <h5 class="text-white">Ligue: (11) 99101-2963</h5>
                </div>             
            </div>
        </div>
    </nav>
    <!-- Fim barra de navegação -->
</header>
<!-- Fim cabeçalho -->